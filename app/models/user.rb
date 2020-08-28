class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes
  has_many :comments, dependent: :destroy
  has_many :sns_credentils
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
end
