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
    


   
   require 'watson/conversation'

    manage = Watson::Conversation::ManageDialog.new(
    username: "selfeki@sfu.ca",
    password: "1mpersonationgam3",
    workspace_id: "9275ca7a-e96a-41b6-a607-cbc405d071c8",
    # Where to link the freely-selected user name with the conversation_id
    storage: 'hash'  #means that you use Ruby hash. If you restart the app, the info will disappear.
    # OR
    # storage: 'redis://127.0.0.1:6379'  #means that you use exteranl database like redis(This gem currently supports redis only).
  )

    puts response1 =  manage.talk("user1", "") #Why should be replaced with actual question

   # sleep 5
   
    # Response.create([{body: bot_reponse.output, user_id: @lobby.id, lobby_id: @lobby.id }])

    #     t.text "body"
    # t.bigint "user_id"
    # t.bigint "lobby_id"


    # User.where(:username => "Paul").includes(:domains).where("domains.name" => "paul-domain").limit(1)
     #:page => params[:page], :per_page => 50
    # Client.where(first_name: 'Lifo').take
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
