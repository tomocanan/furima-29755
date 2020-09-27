class OrdersController < ApplicationController

  def index
    @order = OrderBuyer.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderBuyer.new(order_params)
    @item = Item.find(params[:item_id])
   
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    end
    render 'index'
  end

  private
  def order_params
    params.permit(:price, :token, :area, :city, :address1, :address2, :tell, :postal, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end