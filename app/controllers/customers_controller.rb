class CustomersController < ApplicationController
	def cs_new
		@customer = Customer.new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		@customer = Customer.new(cs_params)
		if @user.save
			flash[:success] = "Welcome " + @user.name + ", to Umi Ukasyah's Homestay"
			redirect_to @user
	else
		render 'cs_new'
	end
  end
  private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :status => 1)
	end
	def cs_params
		params.require(:customer).permit(:name, :phone)
	end
end
