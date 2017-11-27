class ResponsesController < ApplicationController


  	def new
  		@response = Response.new
  	end

	def create
		response = Response.new(response_params)
		current_user = User.where(:id => session[:user_id]).first
		response.user = current_user
		if response.save
			#add to response list for current round?
			ActionCable.server.broadcast 'responses', response: response.body, user: response.user.username
			head :ok
		else
			render 'lobby/show'
			# should instead redirect to a controller#method which better handles the issue
		end
	end

	private

		def response_params
			params.require(:response).permit(:content, :chatroom_id, :lobby_id)
		end

end
