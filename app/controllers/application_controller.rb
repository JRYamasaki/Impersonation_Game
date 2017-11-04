class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception


	before_action :verify_login 


	private
	def verify_login
		if session[:user_id] == nil
			flash.notice = "You must log in first!"
			redirect_to('/access/login')
			
		end
	end
end


# will include before_action :except => login, registration etc...