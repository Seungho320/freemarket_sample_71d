class ToppageController < ApplicationController

  def index
    @items = Item.limit(10).order('created_at DESC')
    @category = Category.all

    @main_category = Category.where(sub: '0')
    @categories = Category.where(sub: params[:id], sub_sub: params[:sub_sub])
    @sub_sub_categories = Category.where(sub: params[:sub_sub], sub_sub: params[:sub] )
    respond_to do |format|
      format.html
      format.json
    end
  end

end
