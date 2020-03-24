class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item_imgs, dependent: :destroy
end