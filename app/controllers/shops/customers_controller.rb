class Shops::CustomersController < ShopsController
  def index
    orders = Order.where(shop_id: current_shop.id)
    ordered_customers = []
    orders.each do |order|
      ordered_customers << order.customer
    end
    @customers = ordered_customers.uniq
  end


  def show
    @customer = Customer.find(params[:id])
    @reviews = Review.where(customer_id: params[:id], shop_id: current_shop.id)
  end
end
