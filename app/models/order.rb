class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :Area

  belongs_to :user
  belongs_to :item
  has_one :buyer
end
