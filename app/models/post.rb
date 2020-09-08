class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes
  has_many :comments, dependent: :destroy

  validates :name, :text, presence: true

  def self.search(search)
    if search != ''
      Post.where('name LIKE(?)', "%#{search}%")
    else
      Post.all # 空の場合postの中身を全て取得
    end
  end
end
