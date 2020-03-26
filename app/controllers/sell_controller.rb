class SellController < ApplicationController
  def index
    @items = Item.all
  end
  def show
    @item = Item.find(params[:id])
    @category = Category.find(@item.category_id)
    @brand = Brands.find(@item.brand_id)
    @condition = Item_condition.find(@item.item_condition_id)
    @send_day = Send_days.find(@item.send_days_id)
    @area = Area.find(@item.area_id)
    @seller = User.find(@item.seller_id_id)
  end
  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to(user_session_path)
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_sell_path unless @item.valid?
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :brand_id, :item_condition_id, :area_id, :send_days_id).merge(seller_id_id: current_user.id)
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: 300,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end
end
