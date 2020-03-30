class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def new
  end

  def show
  end

  def item_status
    @items = Item.where(seller_id_id: current_user.id)
  end


end
