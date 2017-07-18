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
	def c_session
	end
	def cusl
		cust = Customer.find_by(email: params[:customer][:email].downcase)
		if cust && cust.authenticate(params[:customer][:password])
			loginc cust
			$log = 2
			flash[:success] = "Logged in as Customer"
			redirect_to root_url
		else
			flash[:success] = "Failed in as Customer"
			render 'm_session'
		end
	end
	def destroy
		logout
		redirect_to root_url
	end
	private
		def cus_params
			params.require(:customer).permit(:name, :email, :password, :status, :admin)
		end
end
