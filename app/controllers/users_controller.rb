class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def new
  end

  def show
  end

  def item_status
    @items = Item.where(seller_id_id: current_user.id).where(buyer_id_id: nil).order(id:'DESC').page(params[:page]).per(6)
  end
  def sold_items
    @items = Item.where(seller_id_id: current_user.id).where.not(buyer_id_id: nil).order(id:'DESC').page(params[:page]).per(6)
  end
  def bought_items
    @items = Item.where(buyer_id_id: current_user.id).order(id:'DESC').page(params[:page]).per(6)
  end


end
