class Shops::OrdersController < ApplicationController
  before_action :set_order,only:[:show,:update]
  def show
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def index
    if params[:customer_id]
      @orders = Order.where(customer_id: params[:customer_id], shop_id: current_shop.id)
    else
    @orders = Order.where(shop_id: current_shop.id)
    end
  end

  def update
    @order.update(order_params)
    redirect_to shops_order_path(@order.id)
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:delivery_status)
  end
end
