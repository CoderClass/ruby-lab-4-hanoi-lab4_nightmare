class MessagesController < ApplicationController
  def index
  	set_room
  	@messages = @room.messages
    respond_to do |format|
      format.html
      format.json { render json: @messages}
      format.js
    end
  end

  def create
  	set_room
  	@message = @room.messages.build message_params
    @message.name = current_user
    @message.save

    respond_to do |format|
      format.html do
  	    unless @message.persisted?
  		    flash[:error] = "Can not send message."
  	    end
  	    redirect_to room_messages_path(@room)
      end

      format.js
    end
  end

  private

  def message_params
  	params.require(:message).permit(:content)
  end

  def set_room
  	@room = Room.find params[:room_id]
  end
end
