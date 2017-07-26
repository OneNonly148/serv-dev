class StaticPagesController < ApplicationController
  def test_save
    name = params["name"]
    email = params["email"]
    test_save = Test.create(name: name, email: email)
    respond_to do |format|
			format.json {render json: name.to_json, status: :ok }
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
