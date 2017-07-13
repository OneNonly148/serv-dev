class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.find_by(email: params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password])
		login user
		if user.admin? && user.status == '0'
			redirect_to '/mng'
		elsif user.status == '2'
			redirect_to '/spp'
		elsif user.status == '1'
			redirect_to '/csp'
		end
	else
		flash.now[:danger] = "Invalid email/password"
		render 'new'
	end
  end

  def destroy
	logout
	redirect_to root_url
  end
end
