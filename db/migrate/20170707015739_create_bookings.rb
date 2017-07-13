class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :phone_no
      t.string :email
      t.string :booking_date
      t.string :booking_ses
      t.string :serv_loc
      t.string :car_make
      t.string :car_model
      t.string :car_year

      t.timestamps
    end
  end
end
