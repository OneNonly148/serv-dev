class BookingsController < ApplicationController
	def booking
	@booking = Booking.new
  end

  def create
		@booking = Booking.create(booking_params)
		if @booking.save
			BookingMailMailer.booking_mail(@booking).deliver_now
	    BookingMailMailer.admin_mail(@booking).deliver_now
			flash[:success] = "Booking Made, a copy sent to your email"
			redirect_to root_url
		else
			flash.now[:danger] = "Unable to Book"
			redirect_to root_url
		end
	end

	def load_car_makes
		option_no = params["option_no"].to_i
		# Option selection to load car make details
		if option_no == 1
				car_make = Make.where(id:[1,2])
		elsif option_no == 2
				car_make = Make.where(id:[1,2])
		elsif option_no == 3
				car_make = Make.where(id:[2])
		elsif option_no == 4
				car_make = Make.where(id:[3..9])
		else
				car_make = 0
		end

		respond_to do |format|
			format.json { render json: car_make.to_json, status: :ok }
		end
	end

	def load_car_models
		make_no = params["make_no"].to_i
		if make_no == 1
			car_model = Model.where(id:[1..17])
		elsif make_no == 2
			car_model = Model.where(id:[18..25])
		else
			car_model = 0
		end

		respond_to do |format|
			format.json { render json: car_model.to_json, status: :ok }
		end
	end

  private
				def booking_params
					params.require(:booking).permit(:name, :phone_no, :email, :prefered_booking_date, :booking_ses, :serv_loc, :car_make, :car_year, :car_model)
				end
end
