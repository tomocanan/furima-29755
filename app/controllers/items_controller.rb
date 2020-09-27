class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]
  before_action :pick_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    @order = OrderBuyer.new(order_params)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    return redirect_to root_path if @item.valid? && @item.save

    render 'new'
  end

  def show
    @order = OrderBuyer.new(order_params)
  end

  def edit
  end

  def update
    @item.update(item_params)
    return redirect_to item_path if @item.valid?

    render 'edit'
  end

  def destroy
    return  redirect_to root_path if @item.destroy
    
    render 'edit'
  end

  private

  def order_params
    params.permit(:price, :token, :area, :city, :address1, :address2, :tell, :postal, :item_id)
  end

  def item_params
    params.require(:item).permit(:image, :info, :name, :price, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def pick_item
    @item = Item.find(params[:id])
  end
end
