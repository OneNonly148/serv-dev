class CustomerController < ApplicationController
	def c_new
		@customer = Customer.new
	end
	def create
		@customer = Customer.new(cus_params)
		if @customer.save
			flash[:sucess] = "Account Created"
			redirect_to root_url
		else
			flash.now[:danger] = "Failed to create an account"
			render 'c_new'
		end
	end
	private
		def cus_params
			params.require(:customer).permit(:name, :email, :password, :status, :admin)
		end
end
