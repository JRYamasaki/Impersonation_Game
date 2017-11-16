class LobbyController < ApplicationController

  def index
  	@lobbies = Lobby.all
  end

  def new
  	@lobby = Lobby.new
  end

  def create
    @lobby = current_user.chat_rooms.build(chat_room_params) #specify current user differently?
    if @lobby.save
      flash[:success] = 'Chat room added!'
      redirect_to lobbies_path
    else
      render 'new'
    end
  end

  def show
    @lobby = Lobby.includes(:responses).find_by(id: params[:id]);
    @response = Response.new
  end

  private

  def lobby_params
    params.require(:lobby).permit(:title)
  end
end
