# frozen_string_literal: true

module Public
  class ShopsController < PublicController
    before_action :set_rank_shops, only: %i[index search]
    def index
      @shops = Shop.select(params[:shop_genre]).page(params[:page]).per(15).order(created_at: 'DESC')
    end

    def show
      @shop = Shop.find(params[:id])
      @reviews = Review.where(shop_id: @shop.id)
      @review = Review.new
      @room = Room.find_by(customer_id: current_customer.id, shop_id: @shop.id)
    end

    def search
      @shops = Shop.search(params[:keyward]).page(params[:page]).per(15).order(created_at: 'DESC')
    end

    private

    def set_rank_shops
      @rank_shops = Shop.find(Favorite.group(:shop_id).order('count(shop_id) desc').limit(3).pluck(:shop_id))
    end
  end
end
