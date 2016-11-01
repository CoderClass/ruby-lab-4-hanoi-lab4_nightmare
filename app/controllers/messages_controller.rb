class MessagesController < ApplicationController
  def index
  	@room = Room.find
  	@messages = @messages.room
  end
end
