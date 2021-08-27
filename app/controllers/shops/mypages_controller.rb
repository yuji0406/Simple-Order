class Shops::MypagesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    current_shop.update(shop_params)
    redirect_to action: "show"
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
