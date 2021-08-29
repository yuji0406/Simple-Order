class Shops::OrdersController < ApplicationController
  def show
  end

  def index
    if params[:customer_id]
      @orders = Order.where(customer_id: params[:customer_id], shop_id: current_shop.id)
    else
    @orders = Order.where(shop_id: current_shop.id)
    end
  end

  def update
  end
end
