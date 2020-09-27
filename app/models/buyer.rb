class Buyer < ApplicationRecord
  validates :area, presence: true
  validates :city, presence: true
  validates :address1, presence: true
  
  validates :tell, presence: true
  validates :postal, presence: true
  
  belongs_to :order
end
