class ServicePartnerController < ApplicationController
	def s_new
		@service = ServicePartner.new
	end
	def create
		@service = ServicePartner.new(srv_params)
		if @management.save
			flash[:sucess] = "Account Created"
			redirect_to root_url
		else
			flash.now[:danger] = "Failed to create an account"
			render 's_new'
		end
	end
	def s_session
	end
	def srvl
		
	end
	private
		def srv_params
			params.require(:service).permit(:name, :email, :password, :status, :admin)
		end
end
