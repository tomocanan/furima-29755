class Buyer < ApplicationRecord
  with_options presence: true do
    validates :area
    validates :city
    validates :address1
    validates :tell, format: { with: /\d{10,11}/ }
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
  end
  belongs_to :order
end
