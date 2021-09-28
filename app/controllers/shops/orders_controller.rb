class Shops::OrdersController < ShopsController
  before_action :set_order,only:[:show,:update]
  def show
    @order_items = OrderItem.where(order_id: @order.id)
  end

  def index
    if params[:delivery_status]
      @orders = Order.where(delivery_status: params[:delivery_status], shop_id: current_shop.id).order(created_at: 'DESC')
    elsif params[:customer_id]
      @orders = Order.where(customer_id: params[:customer_id], shop_id: current_shop.id).order(created_at: 'DESC')
    else
      @orders = Order.where(shop_id: current_shop.id).order(created_at: 'DESC')
    end
  end

  def search
    if params[:keyward].present?
      if customer = Customer.find_by('store_name LIKE ?', "%#{params[:keyward]}%")
        @orders = customer.orders.where(shop_id: current_shop.id).order(created_at: 'DESC')
      else
        @orders = Order.none
      end
    else
      @orders = Order.none
    end
  end

  def update
    @order.update(order_params)
    redirect_to shops_order_path(@order.id), notice: "配送ステータスを更新しました。"
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:delivery_status)
  end
end
