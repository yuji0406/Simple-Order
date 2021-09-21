class Public::FavoritesController < PublicController
  def index
    @favorites = Favorite.where(customer_id: current_customer.id)
  end

  def create
    favorite = Favorite.new(favorite_params)
    favorite.save
    redirect_to favorites_path, notice: "お気に入りに登録しました。"
  end

  def destroy
    favorite = Favorite.find_by(customer_id: current_customer, shop_id: params[:shop_id])
    favorite.destroy
    redirect_to favorites_path, alert: "お気に入りから削除しました。"
  end

  private

  def favorite_params
    params.permit(:customer_id,:shop_id)
  end
end
