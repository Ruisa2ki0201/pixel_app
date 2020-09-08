
## アプリケーション名
- Pixel Exhibition

## アプリケーション概要
- Pixel Exhibitionは画像投稿ができユーザーと自分のお気に入りの画像を共有できるアプリです。

## アプリケーションURL
- (https://pixel-app-28266.herokuapp.com/)

## 利用方法
- PIxel EXhibitionは上のURLを開くと利用できます。

## 目指した課題解決
- このアプリケーションを通じて、画像投稿アプリなどを利用する人が手軽に使えるようにするという事を解決したかったからです。
  
## 洗い出した要件定義

# 1.ユーザー管理機能
- 目的:ユーザーは新規登録とログインをする為です。
- 詳細:新規登録でき、新規登録が完了していれば再度ログインができる。またログアウトも可能。<br>
- ストーリー:webサイトの一番上にある新規登録ボタンかログインボタンがあるのでログインしていれば<br>
           そのままログイン、新規なら新規登録をします。ログイン後はログアウトボタンとusernameがあるので<br>
           ログアウトならログアウトできます。<br>
- 見積もり：1時間

# 2.SNS認証機能
- 目的:Googleアカウントで新規登録、ログインをできるようにする為です。<br>
- 詳細:コメントを入力してコメントを送信するとコメントが投稿できます<br>
- ストーリー:新規登録やログインページに飛ぶとGoogleで登録、ログインボタンがあり押すと特定のページに飛びGoogleアカウントでログインできます 
- 見積もり:3時間

# 3.画像投稿機能
- 目的:ユーザーの画像を投稿する為です。<br>
- 詳細:アップロードを押すと投稿画面に遷移し画像を投稿できます。<br>
- ストーリー:ユーザーはアップロードを押すと新規投稿画面に遷移し、画像を投稿できる。<br>
- 見積もり:1時間

# 4.編集機能
- 目的:ユーザーが投稿した内容を編集できるようにする為です。<br>
- 詳細:編集ボタンを押すと自身の投稿した情報を編集できる。<br>
- ストーリー:投稿した画像をクリックし、画像詳細ページに遷移すると編集ボタンがあるのでクリックします。<br>
            編集画面に遷移した後に編集が可能になります。<br>
- 見積もり:30分


# 5.削除機能
- 目的:投稿した内容を削除する為です。
- 詳細:削除ボタンを押すと投稿した内容を削除できます。
- ストーリー:編集と同じく詳細ページに飛ぶと削除ボタンがあるので押します。押すと投稿した内容が削除されます。
- 見積もり:20分

# 6.いいね機能
- 目的:投稿した内容にいいねをできるようにする為です。<br>
- 詳細:いいねボタンを押すといいねができます。<br>
- ストーリー:詳細ページに飛ぶといいねボタンがあるので押します。<br>
            押すと投稿された画像にいいねがついてトップページにもいいねされた回数が表示されます。<br>
- 見積もり：1時間

# 7.検索機能
- 目的:画像を探しやすくする為です。<br>
- 詳細:検索フォームにキーワードを入力するとキーワードに当てはまった画像を探せます。<br>
- ストーリー:webサイトの上に検索フォームがあるのでそこにキーワードを入れると検索が可能になります。<br>
- 見積もり:1時間

# 8.コメント機能
- 目的:投稿した内容にコメントをできるようにする為です。<br>
- 詳細:コメントを入力してコメントを送信するとコメントが投稿できます。<br>
- ストーリー:詳細ページにてコメント入力フォームと送信ボタンがあるのでコメントを入力して送信するとコメントを投稿ができます。<br>
- 見積もり：3時間


## 実装した機能についてのGIFと説明

## 実装予定の機能

1.ユーザーフォロー機能

2.お気に入り機能

3.動画投稿機能

## データベース設計

# usersテーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | null:false  |
| email                | string | null:false  |
| password             | string | null:false  |
| password_confirmation| string | null:false  |
| image                | string | null:false  |

## Association
- has_many : posts
- has_many :likes
- has_many :liked_posts, through: :likes, source: :post
- has_many :comments
- has_many :sns_credentials

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

## sns_credentialsテーブル

| Column               | Type      | Options                      |
| -------------------- | --------- | -----------------------------|
| provider             | string    | null:false                   |
| uid                  | string    | null:false                   |
| user_id              | references| null:false, foreign_key: true|

## Association
- belongs_to :user