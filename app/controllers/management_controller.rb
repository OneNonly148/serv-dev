class ManagementController < ApplicationController
	def m_new
		@management = Management.new
	end
	def create
		@management = Management.new(mng_params)
		if @management.save
			flash[:sucess] = "Account Created"
			redirect_to root_url
		else
			flash.now[:danger] = "Failed to create an account"
			render 'm_new'
		end
	end
	def m_session
	end
	def mngl
		admin = Management.find_by(email: params[:management][:email].downcase)
		if admin && admin.authenticate(params[:management][:password])
			loginm admin
			$log = 1
			flash[:success] = "Logged in as Admin"
			redirect_to root_url
		else
			flash[:success] = "Failed in as Admin"
			render 'm_session'
		end
	end
	def destroy
		logout
		redirect_to root_url
	end
	private
		def mng_params
			params.require(:management).permit(:name, :email, :password, :status, :admin)
		end
end
