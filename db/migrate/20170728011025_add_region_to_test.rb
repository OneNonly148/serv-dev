class AddRegionToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :region, :string
  end
end