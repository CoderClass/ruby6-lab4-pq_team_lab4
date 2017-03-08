class RoomsController < ApplicationController
def create
  	@room = Room.new room_params
  	if @room.save!
  		flash[:success] = "Create room successful!"
  	else 
  		flash[:error] = "Cannot save room"
  	end
  	redirect_to root_path
  end

  def room_params
  	params.require(:room).permit(:name)
  end
end
