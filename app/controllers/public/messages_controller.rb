class Public::MessagesController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    message = Message.new(message_params)
    message.room_id = room.id
    if customer_signed_in?
      message.is_customer = true
    elsif shop_signed_in?
      message.is_customer = false
    end
    if message.save
      redirect_to room_path(room.id), notice: "メッセージを送信しました。"
    else
      redirect_to room_path(room.id), alert: "メッセージを入力して下さい。"
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
