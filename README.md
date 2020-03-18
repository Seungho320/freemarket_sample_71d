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
- belongs_to :area
- belongs_to :user

## areasテーブル
|Column|Type|Options|
|------|----|-------|
|area|string|null: false|
### Association
- belongs_to :user_addresse

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

## item_imgsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|img|string|null: false|
### Association

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
### Association

## item_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|item_condition|string|null: false|
### Association

## send_daysテーブル
|Column|Type|Options|
|------|----|-------|
|send_day|string|null: false|
### Association
