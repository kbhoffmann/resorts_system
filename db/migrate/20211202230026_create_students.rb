class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.string :subject
      t.string :level
      t.boolean :returning_student
      t.integer :age
      t.timestamps
    end
  end
end
