# frozen_string_literal: true

module Shops
  class MypagesController < ShopsController
    def show; end

    def edit
      @shop = current_shop
    end

    def update
      @shop = current_shop
      if @shop.update(shop_params)
        redirect_to shops_mypages_path, notice: '会員情報を変更しました。'
      else
        render :edit
      end
    end

    private

    def shop_params
      params.require(:shop).permit(
        :shop_name,
        :manager,
        :introduction,
        :shop_image,
        :shop_genre,
        :adddress,
        :postal_code,
        :phone_number,
        :email
      )
    end
  end
end
