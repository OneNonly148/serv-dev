class CustomersController < ApplicationController
	def cs_new
		@user = User.new
		@user.customers.build
	end
	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to SERV"
			redirect_to csp_path
		else
			render 'cs_new'
		end
	end
	def show
	end
  private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :status, customers_attributes:[:user_id, :name, :phone])
	end
	
end
