class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, uniqueness: true
  has_one :address
  has_one :profile
  has_many :seller_id, class_name: "Item", foreign_key: "seller_id_id"
  has_many :buyer_id, class_name: "Item", foreign_key: "buyer_id_id"
end
