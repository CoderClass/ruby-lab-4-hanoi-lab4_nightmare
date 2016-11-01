class RoomsController < ApplicationController

	def new
		@room = Room.new
	end

	def create
		@room = Room.create room_params
		if @room.save
			flash[:success] = "Create Room success."
			redirect_to root_path
		else
			flash[:error] = "Error: #{@room.errors.full_messages.to_sentence}"
			render :new
		end
	end

	def show
		@room = Room.find params[:room_id]
		flash[:success] = "Welcome to this room."
		redirect_to romm_message_path(@room)
	end

	private

	def room_params
		params.require(:room).permit(:name)
	end
end
