class ToppageController < ApplicationController

  def index
    @items = Item.limit(10).order('created_at DESC')
    @category = Category.all

    @main_categories = Category.where(sub: '0')
    @sub_categories = Category.where(sub: params[:parent], sub_sub: '0')
    @sub_sub_categories = Category.where(sub: params[:child], sub_sub: params[:grandChild])
    respond_to do |format|
      format.html
      format.json
    end
  end

end
