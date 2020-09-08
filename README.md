
## アプリケーション名
- Pixel Exhibition

## アプリケーション概要
- Pixel Exhibitionは画像投稿ができるアプリです。

## アプリケーションURL
- https://pixel-app-28266.herokuapp.com/

## 利用方法
- ユーザーがお気に入りの画像を投稿て人々と共有したい場合に利用します。

## 目指した課題解決
- このアプリケーションを通じて、写真を撮る事が好きな人が簡単にアップロードできるようにし、
  手軽に使えるアプリにしたかったからです。


## 洗い出した要件定義

1.ユーザー管理機能
  　　　目的：ユーザーは新規登録とログインをする為です。
  　　　詳細：新規登録でき、新規登録が完了していれば再度ログインができる。またログアウトも可能。
  ストーリー：webサイトの一番上にある新規登録ボタンかログインボタンがあるのでログインしていれば
  　　　　　　そのままログイン、新規なら新規登録をします。ログイン後はログアウトボタンとusernameがあるので
  　　　　　　ログアウトならログアウトできます。
  　見積もり：1時間
2.SNS認証機能
  　　　目的：Googleアカウントでユーザーを登録する為です。
  　　　詳細：コメントを入力してコメントを送信するとコメントが投稿できます
  ストーリー：新規登録やログインページに飛ぶとGoogleで登録、ログインボタンがあり押すと特定のページ
  　　　　　　飛びGoogleアカウントでログインできます 
  　見積もり：3時間
3.画像投稿機能
       目的：画像を投稿する為
  　　　詳細：画像投稿ボタンを押すと画像、名前、文などが投稿できます。
  ストーリー：ユーザー管理機能と同じくwebサイトのヘッダー部分に画像投稿ボタンがあるので押すと画像、
            名前、説明文などが投稿できます。
  　見積もり：1時間
4.編集機能
       目的：投稿した物を編集する為
  　　　詳細：編集ボタンを押すと投稿した内容を編集したりできます。
  ストーリー：投稿した画像をクリックし、詳細ページに飛ぶと編集ボタンがあるので押す。押すと投稿した内容が反映され編集が可能になります。
  　見積もり：30分
5.削除機能
       目的：投稿した内容を削除する為
  　　　詳細：削除ボタンを押すと投稿した内容を削除できます。
  ストーリー：編集と同じく詳細ページに飛ぶと削除ボタンがあるので押します。押すと投稿した内容が削除されます。
  　見積もり：20分
6.いいね機能
       目的：投稿した内容にいいねをできるようにする為です。
  　　　詳細：いいねボタンを押すといいねができます。
  ストーリー：詳細ページに飛ぶといいねボタンがあるので押します。
  　　　　　　押すと投稿された画像にいいねがついてトップページにもいいねされた回数が表示されます。
  　見積もり：1時間
7.検索機能
       目的：画像を探しやすくする為です。
  　　　詳細：検索フォームにキーワードを入力するとキーワードに当てはまった画像を探せます。
  ストーリー：webサイトの上に検索フォームがあるのでそこにキーワードを入れると検索が可能になります。
  　見積もり：1時間
8.コメント機能
       目的：投稿した内容にコメントをできるようにする為です。
  　　　詳細：コメントを入力してコメントを送信するとコメントが投稿できます。
  ストーリー：詳細ページにてコメント入力フォームと送信ボタンがあるのでコメントを入力して送信すると
            コメントを投稿ができます。
  　見積もり：3時間


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