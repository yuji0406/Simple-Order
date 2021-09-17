class Public::MypagesController < PublicController
  def show
  end

  def edit
  end

  def update
    @current_customer = current_customer
    if @current_customer.update(customer_params)
    redirect_to mypages_path, notice: "会員情報を変更しました。"
    else
    render :edit
    end
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
