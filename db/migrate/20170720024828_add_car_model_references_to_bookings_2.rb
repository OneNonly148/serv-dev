class AddCarModelReferencesToBookings2 < ActiveRecord::Migration[5.1]
  def change
    add_reference :bookings, :models, foreign_key: true
  end
end
