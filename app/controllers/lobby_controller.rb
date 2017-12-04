class LobbyController < ApplicationController

  before_action :reset_user_current_lobby, :only => [:index, :new, :create, :show, ]



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
    @lobby = Lobby.includes(:responses).find_by(id: params[:id]);
    # @lobby = Lobby.find_by(id: params[:id]);
    @response = Response.new
  end

  def lobby
    @current_user = User.where(:id => session[:user_id]).first
    @lobby = Lobby.includes(:responses).find_by(id: params[:id]);
    @current_user.update(current_lobby: @lobby.id)
    @lobby.update_attribute(:spotsLeft, @lobby.spotsLeft + 1);
    # @lobby = Lobby.find_by(id: params[:id]);
    @response = Response.new
    @lobby_users = User.where(current_lobby: @lobby.id)
    render('lobby/lobby')


  end

  def display_bot_message
    @lobby = Lobby.includes(:responses).find_by(id: params[:id]);
    questionAsked = params[:questionAsked]

    require 'ruby-cleverbot-api'
    cleverbot = Cleverbot.new('CC5q0w8xaWRMkuvtQ1UFMpsjyXQ')

    bot_text  = cleverbot.send_message(questionAsked)

    ActionCable.server.broadcast "responses", response: bot_text, user: "bot", lobby_id: @lobby.id, is_bot: "yes", is_response: "1"
  end

  def click_wrong_response
    @lobby = Lobby.includes(:responses).find_by(id: params[:id]);
    current_user = User.where(:id => session[:user_id]).first
    ActionCable.server.broadcast "responses", is_response: "0", user: current_user.username, correct_guess: "0", lobby_id: @lobby.id
  end

  def click_right_response
    @lobby = Lobby.includes(:responses).find_by(id: params[:id]);
    current_user = User.where(:id => session[:user_id]).first
    ActionCable.server.broadcast "responses", is_response: "0", user: current_user.username, correct_guess: "1", lobby_id: @lobby.id
  end

  def update_player_count
    @lobby = Lobby.includes(:responses).find_by(id: params[:id]);

    respond_to do |format|
      format.html
      format.json { render json: @lobby }
    end
    #@lobby.update_attribute(session[:pCount], @lobby.spotsLeft);
  end

  def decrement_user_count
    @lobby = Lobby.find_by(id: params[:id]);
    Lobby.decrement_counter(:spotsLeft, @lobby.id);
  end

  private

  def lobby_params
    params.require(:lobby).permit(:title)
  end
end
