class StaticPagesController < ApplicationController
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
    car = params["car"]
    pack = params["pack"]
    package = Package.create(name: pack, car_id: car)
    package.save
    redirect_to book_mng_path
  end
end
