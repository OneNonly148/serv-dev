class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.find_by(email: params[:session][:email].downcase)
	stat = user.status
	if user && user.authenticate(params[:session][:password])
		login user
		if user.status == '1'
			redirect_to '/cs'
		elsif user.status == '2'
			redirect_to '/sp'
		else 
			redirect_to '/mng'
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
