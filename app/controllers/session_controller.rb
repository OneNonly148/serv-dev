class SessionController < ApplicationController
	def l_new
	end
	def create
		admin = Management.find_by(email: params[:session][:email].downcase)
		cust = Customer.find_by(email: params[:session][:email].downcase)
		serv = ServicePartner.find_by(email: params[:session][:email].downcase)

		if admin && admin.authenticate(params[:session][:password])
			login admin
			flash[:success] = "Logged in as Admin"
			redirect_to root_url
		elsif serv && serv.authenticate(params[:session][:password])
			login serv
			flash[:success] = "Logged in as Service Partner"
			redirect_to root_url
		elsif cust && cust.authenticate(params[:session][:password])
			login cust
			flash[:success] = "Logged in as Customer"
			redirect_to root_url
		else
			flash.now[:danger] = 'Invalid email/password'
			render 'l_new'
		end
	end
	def destroy
		logout
		redirect_to root_url
	end
end
