class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item_imgs, dependent: :destroy
  validates :name, :text, :price, :category_id, :brand_id, :item_condition_id, :area_id, :send_days_id, presence: true
end