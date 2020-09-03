# usersテーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null:false  |
| email                | string | null:false  |
| password             | string | null:false  |
| password_confirmation| string | null:false  |
| image                | stirng | null:false  |

## Association
- has_many : posts
- has_many :likes
- has_many :liked_posts, through: :likes, source: :post
- has_many :comments
- has_many :sns_creadentials

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
- has_many :comments

# likesテーブル

| Column   | Type   | Options                      |
| -------- | ------ | ---------------------------- |
| user_id  | integer| null:false, foreign_key: true|
| post_id  | integer| null:false, foreign_key: true|

## Association
- belongs_to : user
- belongs_to : post

# commentsテーブル

| Column    | Type   | Options                      |
| ----------| ------ | ---------------------------- |
| content   | string | null:false                   |
| user_id   | integer| null:false, foreign_key: true|
| post_id   | integer| null:false, foreign_key: true|

## Association
- belongs_to : user
- belongs_to : post

## sns_creadentialsテーブル

| Column               | Type      | Options                      |
| -------------------- | --------- | -----------------------------|
| provider             | string    | null:false                   |
| uid                  | string    | null:false                   |
| user_id              | references| null:false, foreign_key: true|

## Association
- belongs_to :user