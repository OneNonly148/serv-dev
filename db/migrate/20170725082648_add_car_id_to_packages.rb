class AddCarIdToPackages < ActiveRecord::Migration[5.1]
  def change
    add_column :packages, :car_id, :integer
  end
end
