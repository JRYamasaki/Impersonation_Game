class MainpageController < ApplicationController
  before_action :verify_admin, :only => [:adminmainpage]
  before_action :reset_user_current_lobby

  def mainpage
  end
  def adminmainpage
  end
end
