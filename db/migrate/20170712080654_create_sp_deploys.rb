class CreateSpDeploys < ActiveRecord::Migration[5.1]
  def change
    create_table :sp_deploys do |t|
      t.references :spid
      t.string :spname
      t.string :serv_loc
      t.string :date_book
      t.string :time_book
      t.references :csid
      t.string :csname

      t.timestamps
    end
  end
end
