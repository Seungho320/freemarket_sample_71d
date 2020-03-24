class ToppageController < ApplicationController

  def index
    @items = Item.limit(10).order('created_at DESC')
    @category = Categories.all

    @main_category = Categories.where(sub: '0')
    @categories = Categories.where(sub: params[:sub], sub_sub: params[:sub_sub])
    # @sub_sub_category = Category.where(sub: params[:sub], sub_sub: params[:sub_sub] )
    respond_to do |format|
      format.html
      format.json
    end
  end

end
