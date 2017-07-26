class AddServiceToTest < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :service, :string
  end
end
