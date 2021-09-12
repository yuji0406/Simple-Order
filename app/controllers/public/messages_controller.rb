class Public::MessagesController < ApplicationController
  def create
    # byebug
    room = Room.find(params[:room_id])
    message = Message.new(message_params)
    message.room_id = room.id
    if customer_signed_in?
      message.is_customer = true
    elsif shop_signed_in?
      message.is_customer = false
    end
    if message.save
      redirect_to room_path(room.id)
    else
      redirect_to room_path(room.id)
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
