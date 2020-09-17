class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid? && @item.save 
      return redirect_to root_path
    end
    render 'new'
  end

  private
  def item_params
    params.require(:item).permit(:image, :info, :name, :price, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
