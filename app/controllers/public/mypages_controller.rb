# frozen_string_literal: true

module Public
  class MypagesController < PublicController
    before_action :set_customer, only: %i[edit update]
    def show; end

    def edit; end

    def update
      if @customer.update(customer_params)
        redirect_to mypages_path, notice: '会員情報を変更しました。'
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
    
    def set_customer
      @customer = current_customer
    end
  end
end
