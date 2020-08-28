class SnsCreadential < ApplicationRecord
  belongs_to :user, optional: true #外部キーの値がない場合でも保存可能
end
