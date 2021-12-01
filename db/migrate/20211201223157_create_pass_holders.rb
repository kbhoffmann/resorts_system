class CreatePassHolders < ActiveRecord::Migration[5.2]
  def change
    create_table :pass_holders do |t|
      t.string :name
      t.integer :age
      t.string :level
      t.boolean :season_pass
      t.timestamps
    end
  end
end
