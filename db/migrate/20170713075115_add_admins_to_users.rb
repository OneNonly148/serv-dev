class AddAdminsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admins, :boolean, default: false
  end
end
