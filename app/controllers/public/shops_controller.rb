class Public::ShopsController < ApplicationController
  def index
    @genres = Shop.distinct.pluck(:shop_genre)
    if params[:shop_genre]
      @shops = Shop.where(shop_genre: params[:shop_genre])
    else
      @shops = Shop.all
    end
  end

  def show
    @shop = Shop.find(params[:id])
  end
end
