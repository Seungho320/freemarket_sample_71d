class Items::SearchesController < ApplicationController
  def index
    @items = Item.where(buyer_id_id: nil).search(params[:search]).order(id:'DESC').page(params[:page]).per(6)
  end
end
