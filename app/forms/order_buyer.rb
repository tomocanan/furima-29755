class OrderBuyer
  include ActiveModel::Model
  attr_accessor :postal, :area, :city, :address1, :address2, :tell, :price, :item_id, :user_id, :token

validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
validates :area, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(postal: postal, area: area, city: city, address1: address1, address2: address2, tell:tell, order_id: order.id)
  end

end