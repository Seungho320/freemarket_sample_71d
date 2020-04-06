class PurchaseController < ApplicationController
  
  require 'payjp'

  def show
    @item = Item.find(params[:sell_id])
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    elsif not user_signed_in?
      redirect_to new_user_session_path
    elsif current_user.id == @item.seller_id_id
      redirect_to root_path
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @item = Item.find(params[:sell_id])
    if current_user.id == @item.seller_id_id
      redirect_to root_path
    else
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
    )
    @item.update(buyer_id_id: current_user.id)
    redirect_to action: 'done' #完了画面に移動
    end
  end

end
