class Shops::MypagesController < ShopsController
  def show
  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = current_shop
    if @shop.update(shop_params)
      redirect_to action: "show"
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
