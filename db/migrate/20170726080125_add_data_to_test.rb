class AddDataToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :phone, :string
    add_column :tests, :make, :string
    add_column :tests, :model, :string
    add_column :tests, :location, :string
    add_column :tests, :date, :string
    add_column :tests, :transfer, :string
    add_column :tests, :cash, :string
  end
end
