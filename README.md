# README


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
