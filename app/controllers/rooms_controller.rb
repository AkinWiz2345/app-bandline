class RoomsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @current_user_entries = current_user.entries
    my_room_ids = []
    
    @current_user_entries.each do |e|
      my_room_ids << e.room.id
    end
    
    @another_user_entries = Entry.where(room_id: my_room_ids).where('user_id != ?', current_user.id)
  end


  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(entry_params.merge(room_id: @room.id))
    redirect_to @room
  end

  def show
    @room = current_user.rooms.find_by(id: params[:id])
    if @room
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      flash[:danger] = '権限がありません。'
      redirect_back(fallback_location: root_path)
    end
    
  end
  
  private
  
  def entry_params
    params.require(:entry).permit(:user_id, :room_id)
  end
  
end
