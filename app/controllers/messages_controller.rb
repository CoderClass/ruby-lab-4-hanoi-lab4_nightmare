class MessagesController < ApplicationController
  def index
  	set_room
  	@messages = @room.messages
  end

  def create
  	set_room
  	@message = @room.messages.build message_params
    @message.name = current_user
  	unless @message.save
  		flash[:error] = "Can not send message."
  	end

  	redirect_to room_messages_path(@room)
  end

  private

  def message_params
  	params.require(:message).permit(:content)
  end

  def set_room
  	@room = Room.find params[:room_id]
  end
end
