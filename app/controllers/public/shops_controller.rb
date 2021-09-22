class Public::ShopsController < PublicController
  def index
    if params[:shop_genre]
      @shops = Shop.where(shop_genre: params[:shop_genre])
    else
      @shops = Shop.all
    end
    @rank_shops = Shop.find(Favorite.group(:shop_id).order('count(shop_id) desc').limit(3).pluck(:shop_id))
  end

  def show
    @shop = Shop.find(params[:id])
    @reviews = Review.where(shop_id: @shop.id)
    @review = Review.new
    @room = Room.find_by(customer_id: current_customer.id, shop_id: @shop.id)
  end

  def search
    if params[:keyward].present?
      @shops = Shop.where('shop_name LIKE ? OR introduction LIKE ?', "%#{params[:keyward]}%", "%#{params[:keyward]}%")
    else
      @shops = Shop.none
    end
  end
end
