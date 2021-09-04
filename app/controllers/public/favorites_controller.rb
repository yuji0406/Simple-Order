class Public::FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def create
    favorite = Favorite.new(favorite_params)
    favorite.save
    redirect_to favorites_path
  end

  def destroy
    favorite = Favorite.find(params[:id])
    favorite.destroy
    redirect_to favorites_path
  end

  private

  def favorite_params
    params.permit(:customer_id,:shop_id)
  end
end
