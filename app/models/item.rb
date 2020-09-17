class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_fee

  with_options numericality: { other_than: 1 } do
  validates :category_id
  validates :status_id
  validates :prefecture_id
  validates :delivery_fee_id
  validates :day_id
  end

  validates :image, presence: true
  validates :info, presence: true
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one :item_transaction
  has_one_attached :image

  has_many :statuses
end
