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

## user_addressテーブル
|Column|Type|Options|
|------|----|-------|
|area_id|
|city|
|address|
|building|
|user_id|
### Association

## areaテーブル
|Column|Type|Options|
|------|----|-------|
|area|
### Association

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|
|last_name|
|first_name_kana|
|last_name_kana|
|phone number|
|birthday_yy|
|birthday_mm|
|birthday_dd|
|icon|
|intoroduction|
|user_id|
### Association

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_img_id|
|item_name|
|item_text|
|price|
|seler-id|
|buyer_id|
|category_id|
|brand_id|
|item_size|
|item_condition_id|
|area_id|
|send_days_id|
