class Shops::OrdersController < ApplicationController
  def show
  end

  def index
    if params[:store_id]
      @orders = Order.where(store_id: params[:store_id])
    else
    @orders = Order.all
    end
  end

  def update
  end
end
