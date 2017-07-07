class StaticPagesController < ApplicationController
  def booking
	@booking = Booking.new
  end
  def create
	@booking = Booking.new(booking_params)
	if @booking.save
		flash[:success] = "Booking Made"
		redirect_to 'root_url'
	else
		flash.now[:danger] = "Unable to Book"
		redirect_to 'root_url'
	end
  end
end
