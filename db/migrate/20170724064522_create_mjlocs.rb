class CreateMjlocs < ActiveRecord::Migration[5.1]
  def change
    create_table :mjlocs do |t|
      t.string :name

      t.timestamps
    end
  end
end
