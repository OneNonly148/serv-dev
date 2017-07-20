class RemoveColumnCarModelRefIdFromBookings < ActiveRecord::Migration[5.1]
  def change
    remove_column :bookings, :car_model_ref_id
  end
end
