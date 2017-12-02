class ResponsesController < ApplicationController


  	def new
  		@response = Response.new
  	end

	def create
		response = Response.new(response_params)
		current_user = User.where(:id => session[:user_id]).first
		# current_user.score = Score.new
		response.user = current_user
		if response.save
			#add to response list for current round?
			ActionCable.server.broadcast "responses", response: response.body, user: response.user.username, lobby_id: response.lobby.id
			head :ok
		else
			render 'lobby/lobby'
			# should instead redirect to a controller#method which better handles the issue
		end
	end

	private

		def response_params
			params.require(:response).permit(:body, :chatroom_id, :lobby_id, :user, :lobby)
		end

end
