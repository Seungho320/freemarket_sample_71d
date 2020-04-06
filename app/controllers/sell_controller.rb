class SellController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:edit]
  def index
    @items = Item.where(buyer_id_id: nil).order(id:'DESC').page(params[:page]).per(6)
  end
  def show
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
      @item.item_imgs.new
      @categories = Category.where(sub: params[:sub], sub_sub: params[:sub_sub])
      respond_to do |format|
        format.html
        format.json
      end
    else
      redirect_to root_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '投稿が完了しました'
    else
      redirect_to new_sell_path unless @item.valid?
    end
  end

  def edit
    @main_category = Category.where(sub: '0')
    @sub_category = Category.where(sub: "#{@smallcategory.sub}", sub_sub: '0') unless Category.find(@item.category_id).sub_sub == '0'
    @sub_sub_category = Category.where(sub_sub: "#{@smallcategory.sub_sub}" )
    item = Item.find(params[:id])
    unless item.seller_id_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :price, :category_id, :brand_id, :item_condition_id, :area_id, :send_days_id, item_imgs_attributes: [:img, :id]).merge(seller_id_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: 300,
    card: params['payjp-token'],
    currency: 'jpy'
    )
  end

  # カテゴリー
  def set_category
    @smallcategory = Category.find(@item.category_id)
    @category = Category.find(Category.find(@item.category_id).sub_sub) unless Category.find(@item.category_id).sub_sub == '0'
    @bigcategory = Category.find(Category.find(@item.category_id).sub)
  end

end
