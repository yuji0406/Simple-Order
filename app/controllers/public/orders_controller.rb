class Public::OrdersController < ApplicationController
  def new
    @shop = Shop.find(params[:shop_id])
    @order = Order.new
    @cart_items = CartItem.where(customer_id: current_customer, shop_id: params[:shop_id])
  if params[:sum_price].to_i > 3000
    @postage = 0
  else
    @postage = 400
  end
  end

  def complete
  end

  def create
    order = Order.new(order_params)
  if order.save
    cart_items = CartItem.where(customer_id: current_customer.id, shop_id: order.shop_id)
    cart_items.each do |cart_item|
      order_item = OrderItem.new
      order_item.amount = cart_item.amount
      order_item.price = cart_item.item.tax_price
      order_item.order_id = order.id
      order_item.item_id = cart_item.item_id
      order_item.save
    end
    cart_items.destroy_all
    redirect_to orders_complete_path
  else
    render :new
  end
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])

  end

  private

  def order_params
    params.require(:order).permit(
      :delivery_on,
      :payment,
      :customer_id,
      :shop_id,
      :order_postage,
      :total_price
      )
  end
end
