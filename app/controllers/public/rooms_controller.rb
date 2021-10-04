# frozen_string_literal: true

module Public
  class RoomsController < ApplicationController
    def index
      if customer_signed_in?
        @rooms = current_customer.rooms
      elsif shop_signed_in?
        @rooms = current_shop.rooms
      else
        redirect_to root_path
      end
    end

    def show
      @room = Room.find(params[:id])
      @message = Message.new
      @messages = @room.messages
      if customer_signed_in?
        if @room.customer.id == current_customer.id
          @shop = @room.shop
        else
          redirect_to root_path
        end
      elsif shop_signed_in?
        if @room.shop.id == current_shop.id
          @customer = @room.customer
        else
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end

    def create
      if customer_signed_in?
        room = Room.new(room_shop_params)
        room.customer_id = current_customer.id
      elsif shop_signed_in?
        room = Room.new(room_customer_params)
        room.shop_id = current_shop.id
      end
      room.save
      redirect_to room_path(room.id)
    end
  end
end

private

def room_shop_params
  params.require(:room).permit(:shop_id)
end

def room_customer_params
  params.require(:room).permit(:customer_id)
end
