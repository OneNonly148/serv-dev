class CreateServicePartners < ActiveRecord::Migration[5.1]
  def change
    create_table :service_partners do |t|
      t.string :name
      t.string :phone
      t.string :ic
      t.string :address
      t.string :edu_inst
      t.string :edu_study
      t.string :oc_position
      t.string :oc_sal
      t.string :oc_trans
      t.string :oc_cover
      t.string :oc_exp

      t.timestamps
    end
  end
end
