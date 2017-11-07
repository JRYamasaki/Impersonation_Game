class MainpageController < ApplicationController
  before_action :verify_admin, :only => [:adminmainpage]
  def mainpage
  end
  def adminmainpage
  end
end
