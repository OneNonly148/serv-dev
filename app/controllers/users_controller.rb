class UsersController < ApplicationController
  def new
	
  end
  def create
	@user = User.new(user_params)
	if @user.save 
		login @user
		flash.now[:success] = "Welcome to SERV"
		redirect_to root_url
	else
		render 'new'
	end
  end
  def show
	@user = User.find(params[:id])
  end
  def edit
  end
  def s_list
	@user = User.all
  end
  def s_deploy
  end
  def s_deployed
  end
  def index
	@users = User.all
  end
  def grant
	user = User.find(params[:id])
	user.update_attribute(:access_level, "2")
	flash[:success] = "Admin Previlage Granted"
	redirect_to users_url
  end
  def demote
	user = User.find(params[:id])
	user.update_attribute(:access_level, "3")
	flash[:success] = "Admin Previlage Demoted"
	redirect_to users_url
  end
  def destroy
	User.find(params[:id]).destroy
	flash[:success] = "User Deleted"
	redirect_to users_url
  end
  private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :status)
 	end
end
