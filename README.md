# README

# アプリケーション名
Run!

# 概要(このアプリでできること)

ランニングの記録の投稿（文字、記録、写真）
ユーザー同士のチャットを使用したコミュニケーション
ユーザーグループの作成

# 本番環境(デプロイ先 テストアカウント＆ID)
URL
http://54.168.214.241/

テストアカウント
Eメール：testuser@run.com
パスワード：testuser

#  制作背景
「うつ病などの精神病や生活習慣病防止の為のランニング習慣化と孤独解消アプリ」
→ランニングのチームを作ること、記録を投稿することによる継続力の増加。

母、兄共に精神病を持ったことが原体験で「脳と心」に関係する社会課題解決がしたい。

特にうつ病は日本の大きな社会問題なので少しでも解決の一助となりたい。
https://next.rikunabi.com/tech/docs/ct_s03600.jsp?p=000307

# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
　⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。

# 工夫したポイント
新規登録機能
グループ内でのチャット機能
複数人によるグループチャット機能
チャット相手の検索機能
チャットグループへのユーザー招待機能
チャットの履歴表示機能
画像送信機能
チャットの自動更新
インクリメンタルサーチ
ビューに明るい彩色を採用
こちらのサイトを参考にして「ビタミン色」を取り入れました。
https://ai-create.net/magazine/2017/10/23/colorpatterns/

#  使用技術(開発環境)
Haml/Scss
Ruby/Ruby on Rails
Javascript
jQuery
MySQL
GitHub
AWS(EC2,S3)
Visual Studio Code

# 課題（現在作成 / 修正中）
投稿機能の一覧表示にすぐ移動できるようにする
RSpecでの単体テスト
細かなビューの修正（読みやすいようにフォントサイズ、色を修正）
エラーの解消
投稿ページへのバリデーション

# 今後実装したい機能（現在作成 / 修正中）
ユーザーごとの投稿ページの充実
ユーザー間のフォロー機能
画像を複数枚投稿できるようにする

# 将来はこういうサイトを作りたいです。
「うつ病の人にWEBで認知行動療法を提供する」
https://u2plus.jp/pages/6-message


## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|
|email|string|null: false, unique: true|
|password|string|null: false, unique: true|

### association
- has_one :profile, dependent::destroy
- has_one :credit_card, dependent::destroy
- has_many :comments, dependent::destroy
- has_many :items, dependent::destroy

## profilesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture_id|references|null: false, foreign_key: true|
|city|string|null: false|
|address_number|string|null: false|
|building|string|
|phone|integer|null: false|
|user_id|references|null: false, foreign_key: true|
|introduction|text|null: false|

### association

- belongs_to :user
- belongs_to_active_hash :prefecture

## credit_card

|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|user_id|references|null: false, foreign_key: true|
|credit_card_id|string|null: false|

### association

- belongs_to :user

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### association

- belongs_to :user
- belongs_to :item

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|explanation|text|null: false|
|price|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|status_id|references|null: false, foreign_key: true|
|delivery_fee|string|null: false|
|prefecture_id|references|null: false, foreign_key: true|
|days_until_shipping|string|null: false|
|brand_id|references|null: false, foreign_key|

### association

- has_many :comments
- has_many :images
- belongs_to :brand
- belongs_to :user
- belongs_to_active_hash :status
- belongs_to_active_hash :prefecture
- belongs_to :category

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key|

### association

- belongs_to :item

## brandsテーブル 

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### association

- has_many :items

## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|

### association

- has_many :items
- has_ancestry

-------------------------
- gem ancestry
- gem active hash
