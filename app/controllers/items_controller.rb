class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :price, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :day_id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
