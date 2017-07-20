class RemoveColumnCarMakeFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :car_make
    remove_column :bookings, :car_model
  end
end
