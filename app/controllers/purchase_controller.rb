class PurchaseController < ApplicationController
  require 'payjp'
# 支払いするときのコントローラー
  def index
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      # redirect_to controller: "cards", action: "new"
      redirect_to new_card_path
    else
      @item = params[:item_id].to_i
      @index = @item * 500
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
      # redirect_to items_path
    end
  end

  def pay
    # binding.pry 
    # @item =item.price[item.id]
    @item = params[:item_id].to_i
    # buy = @item[5].to_i
    # binding.pry
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
    :amount => @item * 500, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end

  def done
    # binding.pry
    @item = params[:item_id].to_i
    # done = @item[3].to_i
    @done = @item * 500
  end

end

