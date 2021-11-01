# frozen_string_literal: true

module Public
  class ItemsController < PublicController
    def show
      @item = Item.find(params[:id])
      @cart_item = CartItem.new
    end

    def index
      @items = Item.select(params[:item_genre], params[:shop_id]).page(params[:page]).per(15).order(created_at: 'DESC')
      # @items = if params[:item_genre] && params[:shop_id]
      #           Item.where(item_genre: params[:item_genre], shop_id: params[:shop_id]).page(params[:page]).per(15).order(created_at: 'DESC')
      #         elsif params[:item_genre]
      #           Item.where(item_genre: params[:item_genre]).page(params[:page]).per(15).order(created_at: 'DESC')
      #         elsif params[:shop_id]
      #           Item.where(shop_id: params[:shop_id]).page(params[:page]).per(15).order(created_at: 'DESC')
      #         else
      #           Item.page(params[:page]).per(15).order(created_at: 'DESC')
      #         end
    end

    def search
      @items = Item.search(params[:keyward]).page(params[:page]).per(15).order(created_at: 'DESC')
    end
  end
end
