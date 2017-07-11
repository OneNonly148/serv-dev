class CreateServicePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :service_partners do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
  end
	
end
