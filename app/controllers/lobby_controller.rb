class LobbyController < ApplicationController

  def index
  	@lobbies = Lobby.all
  end

  def new
  	@lobby = Lobby.new
  end

  def create
    current_user = User.where(:id => session[:user_id]).first
    @lobby = current_user.lobbies.build(lobby_params) #specify current user differently?
    #@lobby = Lobby.new(lobby_params)
    #@lobby = current_user.chat_rooms.build(chat_room_params) #specify current user differently?
    if @lobby.save
      flash[:success] = 'Chat room added!'
      redirect_to action: "lobby", id: @lobby.id
    else
      render 'new'
    end
  end

  def show
    # @lobby = Lobby.includes(:responses).find_by(id: params[:id]);
    @lobby = Lobby.find_by(id: params[:id]);
    @response = Response.new
  end

  def lobby
    # @lobby = Lobby.includes(:responses).find_by(id: params[:id]);
    @lobby = Lobby.find_by(id: params[:id]);
    @response = Response.new
  end

  private

  def lobby_params
    params.require(:lobby).permit(:title)
  end
end
