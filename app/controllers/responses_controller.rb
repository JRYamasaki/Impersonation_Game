class ResponsesController < ApplicationController
  

  	def new
  		@response = Response.new
  	end

	def create
		response = response.new(response_params)
		current_user = User.where(:id => session[:user_id]).first
		response.user = current_user
		if response.save
			#add to response list for current round?
			ActionCable.server.broadcast 'responses', response: response.body, user: response.user.username
			head :ok
		end
		else
			render 'lobby/show'
			# should instead redirect to a controller#method which handles the issue better
		end
	end

	private

	def message_params
		params.require(:response).permit(:content, :chatroom_id)
	end
end
