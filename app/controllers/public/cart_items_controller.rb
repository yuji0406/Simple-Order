class Public::CartItemsController < PublicController
  before_action :set_cart_item, only:[:update,:destroy]


  def index
    cart_items = CartItem.where(customer_id: current_customer.id)
    @shops = cart_items.group_by(&:shop_id)
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: "数量を変更しました。"
    else
      redirect_to cart_items_path, alert: "数量を入力してください。"
    end
  end

  def empty
    cart_items = CartItem.where(customer_id: current_customer.id, shop_id: params[:shop_id])
    cart_items.destroy_all
    redirect_to cart_items_path, notice: "商品を削除しました。"
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_items_path, notice: "商品を削除しました。"
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path, notice: "カートに入れました。"
    else
      redirect_to item_path(@cart_item.item.id), alert: "数量を入力して下さい。"
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount,:customer_id,:item_id,:shop_id)
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
