# frozen_string_literal: true

module Shops
  class ItemsController < ShopsController
    before_action :set_item, only: %i[show edit update]

    def index
      @items = if params[:item_genre]
                 Item.where(item_genre: params[:item_genre], shop_id: current_shop.id).page(params[:page]).per(15).order(created_at: 'DESC')
               else
                 Item.where(shop_id: current_shop.id).page(params[:page]).per(15).order(created_at: 'DESC')
               end
    end

    def search
      if params[:keyward].present?
        items = Item.where('item_name LIKE ?', "%#{params[:keyward]}%")
        @items = items.where(shop_id: current_shop.id).page(params[:page]).per(15).order(created_at: 'DESC')
      else
        @items = Item.none
      end
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      @item.shop_id = current_shop.id
      if @item.save
        redirect_to shops_item_path(@item.id), notice: '商品を登録しました。'
      else
        render :new
      end
    end

    def show; end

    def edit; end

    def update
      if @item.update(item_params)
        redirect_to shops_item_path(@item.id), notice: '商品情報を変更しました。'
      else
        render :edit
      end
    end

    private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(
        :item_name,
        :item_genre,
        :item_image,
        :item_introduction,
        :item_price,
        :sale_status
      )
    end
  end
end
