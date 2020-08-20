# users　テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null:false  |
| email                | string | null:false  |
| password             | string | null:false  |
| password_confirmation| string | null:false  |

## Association
- has_many : posts
- has_many :likes
- has_many :liked_posts, through: :likes, source: :post

# postsテーブル

| Column   | Type   | Options                      |
| -------- | ------ | ---------------------------- |
| name     | string | null:false                   |
| text     | string | null:false                   |
| user_id  | integer| null:false, foreign_key: true|

## Association
- belongs_to : user
- has_many :likes
- has_many :liked_users, through: :likes, source: :user

# likesテーブル

| Column   | Type   | Options                      |
| -------- | ------ | ---------------------------- |
| user_id  | integer| null:false, foreign_key: true|
| post_id  | integer| null:false, foreign_key: true|

## Association
- belongs_to : user
- belongs_to : post