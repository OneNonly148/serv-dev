class AddEmailToServicePartners < ActiveRecord::Migration[5.1]
  def change
    add_column :service_partners, :email, :string
  end
end
