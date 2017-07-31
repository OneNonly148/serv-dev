class StaticPagesController < ApplicationController
  def test
  end
  def load_pack
    pack = Package.where(id:[1..5])
    respond_to do |format|
			format.json { render json: pack.to_json, status: :ok }
		end
  end
  def load_region
		mjloc = Mjloc.where(id:[1..5])
		respond_to do |format|
			format.json { render json: mjloc.to_json, status: :ok }
		end
	end
	def load_locate
		region = params["region"].to_i
		if region == 2
			mnloc = Mnloc.where(id:[1..2])
		end
		respond_to do |format|
			format.json { render json: mnloc.to_json, status: :ok }
		end
	end
	def load_car_makes
		option_no = params["option_no"].to_i
		if option_no == 2
				car_make = Make.where(id:[1,2,3])
		elsif option_no == 3
				car_make = Make.where(id:[1,2,3])
		elsif option_no == 4
				car_make = Make.where(id:[1,3])
		elsif option_no == 5
				car_make = Make.where(id:[1,4..10])
		else
				car_make = 0
		end
		respond_to do |format|
			format.json { render json: car_make.to_json, status: :ok }
		end
	end
	def load_car_models
		make_no = params["make_no"].to_i
		if make_no == 2
			car_model = Model.where(id:[1..18])
		elsif make_no == 3
			car_model = Model.where(id:[1,19..26])
		else
			car_model = 0
		end
		respond_to do |format|
			format.json { render json: car_model.to_json, status: :ok }
		end
	end
  def test_save
    name = params["name"]
    email = params["email"]
    phone = params["phone"]
    make = params["make"]
    modelv = params["model"]
    servicev = params["service"]
    region = params["region"]
    location = params["location"]
    date = params["date"]
    transfer = params["transfer"]
    cash = params["cash"]
    servicen = params["servicen"]
    maken = params["maken"]
    modeln = params["modeln"]
    regionn = params["regionn"]
    locationn = params["locationn"]
    test_save = Test.create(name: name, email: email, phone: phone, make: make, model: modelv, region: region, service: servicev, location: location, date: date, transfer: transfer, cash: cash)
    BookingMailMailer.booking_mail(name, email, phone, servicen, maken, modeln, date, regionn, locationn, transfer, cash,).deliver_now
    respond_to do |format|
			format.json {render json: test_save.to_json, status: :ok }
		end
  end
  def booking_mng
    @package = Package.all
    @newpack = Package.new
    @make = Make.all
    @model = Model.all
  end
  def destroy
    @package = Package.find(params[:pack])
    @package.destroy
    flash[:success] = "Package Deleted"
    redirect_to book_mng_path
  end
  def create
    car1 = params["proton"]
    car2 = params["produa"]
    car3 = params["others"]
    pack = params["pack"]
    package = Package.create(name: pack, proton: car1, produa: car2, others: car3)
    package.save
    flash[:success] = "Package Created"
    redirect_to book_mng_path
  end
end
