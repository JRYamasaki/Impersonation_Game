class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :verify_login

	private
	def verify_login
		if  session[:user_id] == nil
			flash.notice = "Please Login"
			redirect_to('/access/login')

		end
	end

	def verify_admin
		admin_emails = ["jyamasak@sfu.ca", "mccline@sfu.ca", "rgodard@sfu.ca", "selfeki@sfu.ca"]
		current_user = User.where(:id => session[:user_id]).first
		if !admin_emails.include? current_user.email
			flash.notice = "You do not have access rights to the Admin Page"
			redirect_to('/mainpage/mainpage')
		end
	end

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

	# # helpful documentation --> https://github.com/alpha-netzilla/watson-conversation

	# # following are examples of how to use the Conversation API:

	# Get a greet message from a conversation service.
	puts response1 = manage.talk("user1", "")
	# => {user: user1, status_code: 200, output: [\"What would you like me to do?\"]}

	# Get a response to a user's input.
	puts response2 = manage.talk("user1", "I would like you to ...")
	#=> {user: user1, status_code: 200, output: [\"I help you ...\"]}

	# Check if the user exists
	puts manage.has_key?("user1")

	# Delete the user
	puts manage.delete("user1")

end
