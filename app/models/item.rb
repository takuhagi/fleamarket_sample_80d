class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  
  validates :images, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_until_shipping_id, presence: true
  
  # 出品中、売却済みの判断 Userモデルに記載
  # belongs_to :saler, class_name: "User"
  # belongs_to :buyer, class_name: "User"
end
