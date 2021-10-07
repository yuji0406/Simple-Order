# frozen_string_literal: true

module Public
  class OrdersController < PublicController
    def new
      @shop = Shop.find(params[:shop_id])
      @order = Order.new
      @cart_items = CartItem.where(customer_id: current_customer, shop_id: params[:shop_id])
      @sum_price = params[:sum_price]
      @postage = if @sum_price.to_i > 3000
                   0
                 else
                   400
                 end
      @total_price = @sum_price.to_i + @postage
    end

    def complete; end

    def create
      @order = Order.new(order_params)
      if @order.save
        cart_items = CartItem.where(customer_id: current_customer.id, shop_id: @order.shop_id)
        cart_items.each do |cart_item|
          order_item = OrderItem.new
          order_item.amount = cart_item.amount
          order_item.price = cart_item.item.tax_price
          order_item.order_id = @order.id
          order_item.item_id = cart_item.item_id
          order_item.save
        end
        cart_items.destroy_all
        redirect_to orders_complete_path
      else
        @shop = Shop.find(@order.shop_id)
        @cart_items = CartItem.where(customer_id: current_customer, shop_id: @order.shop_id)
        @total_price = @order.total_price
        @postage = @order.order_postage
        @sum_price = @total_price - @postage
        render :new
      end
    end

    def index
      @orders = Order.where(customer_id: current_customer.id).page(params[:page]).per(10).order(created_at: 'DESC')
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
end
