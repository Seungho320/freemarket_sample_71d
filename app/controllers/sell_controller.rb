class SellController < ApplicationController

  def new
    if user_signed_in?
      @item = Item.new
      @item.item_imgs.new
    else
      render :new
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      redirect_to new_sell_path unless @item.valid?
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :brand_id, :item_condition_id, :area_id, :send_days_id, item_imgs_attributes: [:img]).merge(seller_id_id: current_user.id)
  end

end