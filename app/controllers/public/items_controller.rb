class Public::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    if params[:item_genre] && params[:shop_id]
      @items = Item.where(item_genre: params[:item_genre], shop_id: params[:shop_id])
    elsif
      params[:item_genre]
      @items = Item.where(item_genre: params[:item_genre])
    elsif
      params[:shop_id]
      @items = Item.where(shop_id: params[:shop_id])
    else
      @items = Item.all
    end
      @genres = Item.distinct.pluck(:item_genre)
  end

  def search
    if params[:keyward].present?
      @items = Item.where('item_name LIKE ? OR item_introduction LIKE ?', "%#{params[:keyward]}%", "%#{params[:keyward]}%")
    else
      @items = Item.none
    end
    @genres = Item.distinct.pluck(:item_genre)
  end
end
