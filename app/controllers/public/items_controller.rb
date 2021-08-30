class Public::ItemsController < ApplicationController
  def show
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
end
