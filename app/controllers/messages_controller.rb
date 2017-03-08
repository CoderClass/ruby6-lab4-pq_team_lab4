class MessagesController < ApplicationController
		before_action :set_room
	def index
		
		@messages = Message.where(room_id: params[:room_id])
	end

	def new 
		@message = Message.new
	end

	def create		
		@message = @room.messages.build message_params
		if @message.save
			redirect_back fallback_location: { action: "index", id: @room.id}
		else
			flash[:error] = "Error #{@message.error.full_message.to_sentence}"
			redirect_to room_path
		end
	end

	private

	def set_room
		@room = Room.find_by_id(params[:room_id])
	end
	def message_params
		params.require(:message).permit(:username, :content, :room_id)
	end
end
