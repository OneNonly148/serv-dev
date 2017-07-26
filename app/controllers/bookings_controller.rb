class BookingsController < ApplicationController
	def booking
		@booking = Booking.new
		@package = Package.all
		@mjloc = Mjloc.all
  end

  def create
		#binding.pry
		@booking = Booking.create(booking_params)
		if @booking.save
			@id = @booking.id
			flash[:success] = "Booking Made, a copy sent to your email"
			redirect_to root_url
		else
			flash.now[:danger] = "Unable to Book"
			redirect_to root_url
		end
	end
	def load_region
		mjloc = Mjloc.where(id:[1..4])
		respond_to do |format|
			format.json { render json: mjloc.to_json, status: :ok }
		end
	end
	def load_locate
		region = params["region"].to_i
		if region == 1
			mnloc = Mnloc.where(id:[1])
		end

		respond_to do |format|
			format.json { render json: mnloc.to_json, status: :ok }
		end
	end

	def load_car_makes
		binding.pry
		option_no = params["option_no"].to_i
		package = Package.where(id:[option_no])
		a = package
		if option_no == 18
				car_make = Make.where(id:[1,2])
		elsif option_no == 3
				car_make = Make.where(id:[1,2])
		elsif option_no == 4
				car_make = Make.where(id:[2])
		elsif option_no == 5
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
					params.require(:booking).permit(:name, :phone_no, :email, :prefered_booking_date, :location_id, :package, :model_id)
				end
end
