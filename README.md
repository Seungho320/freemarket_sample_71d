# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version5.0.7.2

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# freemarket_sample_71d DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false|
|passward|string|null: false|
### Association
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_one :user_address,dependent: :destroy
- has_one :card,dependent: :destroy
- has_one :profiles,dependent: :destroy

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone number|intger|null: false, unique: true|
|birthday_yy|date|null: false|
|birthday_mm|date|null: false|
|birthday_dd|date|null: false|
|icon|text||
|intoroduction|text||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_number|intger|null: false, unique: true|
|security|integer|null: false|
|deadline|date|null: false|
### Association
- belongs_to :user

## user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|area_id|references|null: false, foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building|string||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to_active_hash :area
- belongs_to :user

## areasテーブル
|Column|Type|Options|
|------|----|-------|
|area|string|null: false|
### Association
- has_one :user_addresse
- has_many :items

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_img_id|references|null: false, foreign_key: true|
|item_name|string|null: false|
|item_text|text|null: false|
|price|integer|null: false|
|seller-id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|item_condition_id|references|null: false, foreign_key: true|
|area_id|references|null: false, foreign_key: true|
|send_days_id|references|null: false, foreign_key: true|
### Association
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :item_imgs, dependent: :destroy
- belongs_to_active_hash :size
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :send_day
- belongs_to :category
- belongs_to :brand
- belongs_to_active_hash :area

## item_imgsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|img|string|null: false|
### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association
- has_many :items

## item_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|item_condition|string|null: false|
### Association
- has_many :items

## send_daysテーブル
|Column|Type|Options|
|------|----|-------|
|send_day|string|null: false|
### Association
- has_many :items