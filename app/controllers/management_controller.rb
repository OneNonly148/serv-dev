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
	private
		def mng_params
			params.require(:management).permit(:name, :email, :password, :status, :admin)
		end
end
