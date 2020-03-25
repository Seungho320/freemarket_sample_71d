class ItemImg < ApplicationRecord
  mount_uploader :img, ItemImgsUploader
  belongs_to :item, optional: true
end