class CreateResorts < ActiveRecord::Migration[5.2]
  def change
    create_table :resorts do |t|
      t.string :name
      t.boolean :ski_only
      t.integer :runs
      t.string :city

      t.timestamps
    end
  end
end
