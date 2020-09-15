class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_fee


  
  
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :day_id, numericality: { other_than: 1 }


  validates :name, presence: true
  validates :price, presence: true
  # validates :status, presence: true
  # validates :delivery_fee, presence: true
  # validates :area, presence: true
  # validates :day, presence: true

  belongs_to :user
  has_one :item_transaction
  
  has_many :statuses
end
