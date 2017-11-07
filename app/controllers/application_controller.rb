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
end


# will include before_action :except => login, registration etc...
