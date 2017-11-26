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

        ### IBM Watson Conversation Service Agent Warppers
        #
        # There are two different wrappers that can be used to access the IBM Watson Conversation Service API:
        # (1) alpha-netzilla: GitHub Link - https://github.com/alpha-netzilla/watson-conversation
        # (2) artemis: GitHub Link - https://github.com/icalialabs/artemis
        #
        # Both wrappers are configured below, so that if one does not work, we can easily switch to the other.
        # Each Watson Conversation instance will be considered an "agent", which will access the 
	###
        # alpha-netzilla IBM Watson conversation wrapper
        #
        # Documentation link: https://github.com/alpha-netzilla/watson-conversation
        #
        #
	# require 'watson/conversation'

	# agent0 = Watson::Conversation::ManageDialog.new(
	#   username: "selfeki@sfu.ca",
	#   password: "1mpersonationgam3",
	#   workspace_id: "9275ca7a-e96a-41b6-a607-cbc405d071c8",
	#   # Where to link the freely-selected user name with the conversation_id
	#   storage: 'hash'  #means that you use Ruby hash. If you restart the app, the info will disappear.
	#   # OR
	#   # storage: 'redis://127.0.0.1:6379'  #means that you use exteranl database like redis(This gem currently supports redis only).
	# )
        
 #        agent1 = Watson::Conversation::ManageDialog.new(
 #          username: "vaganune@reftoken.net",
 #          password: "Astat@1379",
 #          workspace_id: "1a5ff1af-bc7d-48e7-8207-3190f1729acd",
 #          # Where to link the freely-selected user name with the conversation_id
 #          storage: 'hash'  #means that you use Ruby hash. If you restart the app, the info will be disappeared.
 #          # OR
 #          # storage: 'redis://127.0.0.1:6379'  #means that you use exteranl database like redis(This gem currently supports redis only).
 #        )

        ### artemis IBM Watson conversation service wrapper


        #Chatbot responses and actions
        #
        # Until we determine what specific files will hold the agent responses we will place them here
        #

        # For a given game, the questions will most likely be generated from a databse.
        # The easiest way to pass these questions to the watson conversation service therefore, we need to treat the question like a user-input question 
	# Get a greet message from a conversation service.
	# puts response1 = manage.talk("user1", "") # 1st parameter is 
	# # => {user: user1, status_code: 200, output: [\"What would you like me to do?\"]}

	# # Get a response to a user's input.
	# puts response2 = manage.talk("user1", "I would like you to ...")
	# #=> {user: user1, status_code: 200, output: [\"I help you ...\"]}

	# # Check if the user exists
	# puts manage.has_key?("user1")

	# # Delete the user
	# puts manage.delete("user1")

end
