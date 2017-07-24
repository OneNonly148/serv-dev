class CreateMnlocs < ActiveRecord::Migration[5.1]
  def change
    create_table :mnlocs do |t|
      t.string :name
      t.references :mjloc, foreign_key: true

      t.timestamps
    end
  end
end
