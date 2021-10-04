# frozen_string_literal: true

module Public
  class ItemsController < PublicController
    def show
      @item = Item.find(params[:id])
      @cart_item = CartItem.new
    end

    def index
      @items = if params[:item_genre] && params[:shop_id]
                 Item.where(item_genre: params[:item_genre], shop_id: params[:shop_id]).order(created_at: 'DESC')
               elsif params[:item_genre]
                 Item.where(item_genre: params[:item_genre]).order(created_at: 'DESC')
               elsif params[:shop_id]
                 Item.where(shop_id: params[:shop_id]).order(created_at: 'DESC')
               else
                 Item.all.order(created_at: 'DESC')
               end
    end

    def search
      @items = if params[:keyward].present?
                 Item.where('item_name LIKE ? OR item_introduction LIKE ?', "%#{params[:keyward]}%",
                            "%#{params[:keyward]}%").order(created_at: 'DESC')
               else
                 Item.none
               end
    end
  end
end
