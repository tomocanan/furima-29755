class OrderBuyer
  include ActiveModel::Model
  attr_accessor :postal, :area, :city, :address1, :address2, :tell, :price, :item_id, :user_id, :token

  with_options presence: true do
    validates :area, numericality: { other_than: 1}
    validates :city
    validates :address1
    validates :tell, format: { with: /\d{10,11}/ }
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal: postal, area: area, city: city, address1: address1, address2: address2, tell: tell, order_id: order.id)
  end
end
