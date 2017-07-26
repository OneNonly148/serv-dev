class AddMakesToPackages < ActiveRecord::Migration[5.1]
  def change
    add_column :packages, :proton, :integer
    add_column :packages, :produa, :integer
    add_column :packages, :others, :integer
  end
end
