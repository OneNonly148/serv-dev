class CreateServicePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :service_partners do |t|
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.integer :status
      t.string :name

      t.timestamps
    end
  end
end
