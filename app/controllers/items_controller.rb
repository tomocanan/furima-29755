class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid? 
      @item.save
      return redirect_to root_path
    end
    render 'new'
  end

  # def set
  #   # binding.pry
  #   item = Item.find(params[:id])
  #   if item.set
  #     item.update(set: false)
  #   else
  #     item.update(set: true)
  #   end

  #   add_tax_price = Item.find(params[:id])
  #   render json: { item: add_tax_price }
  # end
  
  private
  def item_params
    params.require(:item).permit(:image, :info, :name, :price, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
