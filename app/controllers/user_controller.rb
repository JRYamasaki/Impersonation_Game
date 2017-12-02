class UserController < ApplicationController

  skip_before_action :verify_login, :only => [:new, :create]
  before_action :verify_admin, :only => [:users]
  def users
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user.score = Score.new

    respond_to do |format|
      if @user.save
        format.html { redirect_to '/user/users', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to '/registration', notice: 'User unable to create!' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to '/user/users', notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
