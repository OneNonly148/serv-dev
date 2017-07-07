class StaticPagesController < ApplicationController
  def booking
	@booking = Booking.new
  end
  def create
	@booking = Booking.create(booking_params)
	if @booking.save
		flash[:success] = "Booking Made"
		redirect_to root_url
	else
		flash.now[:danger] = "Unable to Book"
		redirect_to root_url
	end
  end
   private
	def booking_params
		params.require(:booking).permit(:name, :phone_no, :email, :booking_date, :booking_ses, :serv_loc, :car_make)
	end
end
