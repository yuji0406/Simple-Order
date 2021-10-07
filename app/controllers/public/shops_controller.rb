# frozen_string_literal: true

module Public
  class ShopsController < PublicController
    def index
      @shops = if params[:shop_genre]
                 Shop.where(shop_genre: params[:shop_genre]).page(params[:page]).per(15).order(created_at: 'DESC')
               else
                 Shop.page(params[:page]).per(15).order(created_at: 'DESC')
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
      @shops = if params[:keyward].present?
                 Shop.where('shop_name LIKE ? OR introduction LIKE ?', "%#{params[:keyward]}%",
                            "%#{params[:keyward]}%").page(params[:page]).per(15).order(created_at: 'DESC')
               else
                 Shop.none
               end
    end
  end
end
