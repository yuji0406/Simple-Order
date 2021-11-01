# frozen_string_literal: true

module Public
  class ItemsController < PublicController
    def show
      @item = Item.find(params[:id])
      @cart_item = CartItem.new
    end

    def index
      @items = Item.select(params[:item_genre], params[:shop_id]).page(params[:page]).per(15).order(created_at: 'DESC')
    end

    def search
      @items = Item.search(params[:keyward]).page(params[:page]).per(15).order(created_at: 'DESC')
    end
  end
end
