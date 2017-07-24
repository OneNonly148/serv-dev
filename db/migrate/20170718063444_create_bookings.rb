class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :phone_no
      t.string :email
      t.string :prefered_booking_date
      t.references :location, foreign_key: true
      t.string :package
      t.references :model, foreign_key: true
      t.timestamps
    end
  end
end
