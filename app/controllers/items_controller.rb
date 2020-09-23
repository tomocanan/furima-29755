class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :pick_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
  end

  def update
    @item.update(item_params)
    return redirect_to item_path if @item.valid?
    render 'edit'
  end

  private

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
