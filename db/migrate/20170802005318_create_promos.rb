class CreatePromos < ActiveRecord::Migration[5.1]
  def change
    create_table :promos do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
