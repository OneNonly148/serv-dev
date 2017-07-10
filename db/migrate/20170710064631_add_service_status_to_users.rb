class AddServiceStatusToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :service_status, :string
  end
end
