class AddInstructorToStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :instructor, foreign_key: true
  end
end
