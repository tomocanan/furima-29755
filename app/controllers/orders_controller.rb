class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :pick_item, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
    @order = OrderBuyer.new
  end

  def create
    @order = OrderBuyer.new(order_params)

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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def pick_item
    @item = Item.find(params[:item_id])
  end

end
