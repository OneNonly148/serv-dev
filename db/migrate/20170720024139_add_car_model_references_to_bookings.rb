class AddCarModelReferencesToBookings < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :car_model_ref, foreign_key: true
  end
end
