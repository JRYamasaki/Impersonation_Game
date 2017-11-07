class AccessController < ApplicationController



	skip_before_action :verify_login

  	def login
  		@user = User.new
 	end

  	def attempt_login
	  	if params[:username].present? && params[:password].present?
	  		existing_user = User.where(:username => params[:username]).first
	  		if existing_user
	  			verified_password =  params[:password] == existing_user[:password]
	  		end
	  	end
	  	if verified_password
	  		session[:user_id] = existing_user.id
	  		flash.now.notice = "Logged in succesfully"
	  		redirect_to('/mainpage/adminmainpage')

	  	else
	  		flash.now.notice = "Incorrect username/password"
	  		render('/access/login')
	  	end
	end

	 def signup
	 	redirect_to('/user/new')
	 end



	def logout
		session[:user_id] = nil
		flash.now.notice = "Logged out successfully"
		redirect_to('/access/login')
	end

end
