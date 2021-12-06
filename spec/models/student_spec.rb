require 'rails_helper'

RSpec.describe "Student model" do


  it 'returns only students with boolean returning_student value true' do
    gretchen = Instructor.create!(name: 'Gretchen', subject: "cross-country skiing", teaches_children: true, years_experience:10)
    tommy = gretchen.students.create!(name: 'Tommy', subject: "cross-country skiing", returning_student: true, level: "intermediate")
    dana = gretchen.students.create!(name: 'Dana', subject: "cross-country skiing", returning_student: true, level: "intermediate")
    jim = gretchen.students.create!(name: 'Jim', subject: "cross-country skiing", returning_student: false, level: "intermediate")

    expect(Student.show_only_bool_true).to eq( [tommy, dana])
  end

  it 'orders students by name' do
    gretchen = Instructor.create!(name: 'Gretchen', subject: "cross-country skiing", teaches_children: true, years_experience:10)
    tommy = gretchen.students.create!(name: 'Tommy', subject: "cross-country skiing", returning_student: true, level: "intermediate")
    dana = gretchen.students.create!(name: 'Dana', subject: "cross-country skiing", returning_student: true, level: "intermediate")
    jim = gretchen.students.create!(name: 'Jim', subject: "cross-country skiing", returning_student: false, level: "intermediate")

    expect(Student.by_name).to eq([dana, jim, tommy])
  end


end