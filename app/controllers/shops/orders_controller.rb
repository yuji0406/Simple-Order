class Shops::OrdersController < ApplicationController
  def show
  end

  def index
    if params[:store_id]
      @orders = Order.where(store_id: params[:store_id], shop_id: current_shop.id)
    else
    @orders = Order.where(shop_id: current_shop.id)
    end
  end

  def update
  end
end
