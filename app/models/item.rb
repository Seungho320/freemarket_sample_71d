class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item_imgs, dependent: :destroy
  accepts_nested_attributes_for :item_imgs, allow_destroy: true
  validates_associated :item_imgs
  validates :name, :text, :price, :category_id, :brand_id, :item_condition_id, :area_id, :send_days_id, presence: true
  validates :item_imgs, presence: true
  belongs_to :seller_id, class_name: "User", foreign_key: 'seller_id_id', optional: true
  belongs_to :buyer_id, class_name: "User", foreign_key: 'buyer_id_id', optional: true
end