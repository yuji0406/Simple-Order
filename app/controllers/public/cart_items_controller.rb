class Public::CartItemsController < ApplicationController
  def index
    cart_items = CartItem.where(customer_id: current_customer.id)
    @shops = cart_items.group_by(&:shop_id)
    #byebug
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def empty
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    # byebug
    redirect_to cart_items_path
  end

  def cart_item_params
    params.require(:cart_item).permit(:amount,:customer_id,:item_id,:shop_id)
  end
end
