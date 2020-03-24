class SellController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:items])
    @item.save
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :brand_id, :item_condition_id, :area_id, :send_days_id)
  end

end