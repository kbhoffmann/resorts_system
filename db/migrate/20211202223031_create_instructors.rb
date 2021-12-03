class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :subject
      t.boolean :teaches_children
      t.integer :years_experience
      t.timestamps
    end
  end
end
