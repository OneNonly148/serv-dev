class AddCustomerStatusToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :customer_status, :string
  end
end
