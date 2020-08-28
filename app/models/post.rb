class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to :user
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes
  has_many :comments, dependent: :destroy

  validates :name,:text,:genre_id, presence: true

  validates :genre_id, numericality: { other_than: 1 }

  def self.search(search)
    if search!= ""
      Post.where('name LIKE(?)', "%#{search}%")
    else
      Post.all #空の場合postの中身を全て取得
    end
  end
end
