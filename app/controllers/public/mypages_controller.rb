class Public::MypagesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    current_customer.update(customer_params)
    redirect_to mypages_path
  end

  private

  def customer_params
    params.require(:customer).permit(
      :store_name,
      :store_manager,
      :postal_code,
      :address,
      :phone_number,
      :email
      )
  end
end
