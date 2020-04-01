class Items::SearchesController < ApplicationController
  def index
    @items = Item.search(params[:search])
  end
end
