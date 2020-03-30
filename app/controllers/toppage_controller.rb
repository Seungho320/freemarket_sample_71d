class ToppageController < ApplicationController
  before_action :set_pulldown, only: [:index]

  def index
    @items = Item.limit(10).order('created_at DESC')
  end


  private

  # プルダウン用カテゴリー
  def set_pulldown
    @main_categories = Category.where(sub: '0')
    @sub_categories = Category.where(sub: params[:parent], sub_sub: '0')
    @sub_sub_categories = Category.where(sub: params[:child], sub_sub: params[:grandChild])
    respond_to do |format|
      format.html
      format.json
    end
  end
end
