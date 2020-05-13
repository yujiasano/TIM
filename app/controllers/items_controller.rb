class ItemsController < ApplicationController
def index
  @items = Item.all
end

def new
  Item.new
end

def show
  @item = Item.find(params[:id])
end


# def pay
#   # binding.pry
#   @item = Item.find(params[:id])
#   card = Card.where(user_id: current_user.id).first
#   Payjp.api_key = ENV['PAYJP_SECRET_KEY']
#   Payjp::Charge.create(
#   :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
#   :customer => card.customer_id, #顧客ID
#   :currency => 'jpy', #日本円
# )
# redirect_to action: 'done' #完了画面に移動
# end


end
