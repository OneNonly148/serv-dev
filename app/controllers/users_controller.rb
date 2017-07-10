class UserController < ApplicationController
  def new
	@user = User.new
  end
  def customer
	@user = User.find(params[:id])
  end
  def service
	@user = User.find(params[:id])
  end
  def edit
  end
end
