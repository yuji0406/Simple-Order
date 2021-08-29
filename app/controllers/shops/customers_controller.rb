class Shops::CustomersController < ApplicationController
  def index
    @order = Order.where(shop_id: current_shop.id)
    @customer = []
    @order.each do |order|
      @customer << order.customer
    end
    @customers = @customer.uniq
  end

  def show
  end
end
