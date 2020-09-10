class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes
  has_many :comments, dependent: :destroy
  has_many :sns_creadentials

  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :password_confirmation
    validates :image
  end

  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end

  def self.from_omniauth(auth)
    sns = SnsCreadential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
