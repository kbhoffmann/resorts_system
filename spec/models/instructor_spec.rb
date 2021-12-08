require 'rails_helper'

RSpec.describe Instructor do
  it {should have_many :students}

  it 'shows instructors ordered by most recently created' do
    gretchen = Instructor.create!(name: 'Gretchen', subject: "cross-country skiing", teaches_children: true, years_experience:10)
    tristan = Instructor.create!(name: 'Tristan', subject: "snowboarding", teaches_children: false, years_experience:8)
    bob = Instructor.create!(name: 'Bob', subject: "skiing", teaches_children: false, years_experience:12)

    expect(Instructor.ordered_by_created_at).to eq( [bob, tristan, gretchen])
  end

  # it 'orders instructor instances by count of students highest to lowest' do
  #   gretchen = Instructor.create!(name: 'Gretchen', subject: "cross-country skiing", teaches_children: true, years_experience:10)
  #   sally = gretchen.students.create!(name: 'Sally', subject: "cross-country skiing", returning_student: true, age: 10, level: "intermediate")
  #   billy = gretchen.students.create!(name: 'Billy', subject: "cross-country skiing", returning_student: false, age: 18, level: "intermediate")

  #   tristan = Instructor.create!(name: 'Tristan', subject: "snowboarding", teaches_children: false, years_experience:8)
  #   seth = tristan.students.create!(name: 'Seth', subject: "snowboarding", returning_student: false, age: 15, level: "beginner")

  #   bob = Instructor.create!(name: 'Bob', subject: "skiing", teaches_children: false, years_experience:12)
  #   beth = bob.students.create!(name: 'Beth', subject: "skiing", returning_student: false, age: 15, level: "beginner")
  #   carly = bob.students.create!(name: 'Carly', subject: "skiing", returning_student: false, age: 15, level: "beginner")
  #   andy = bob.students.create!(name: 'Andy', subject: "snowboarding", returning_student: false, age: 15, level: "beginner")
  #   binding.pry
  #   expect(Instructor.ordered_by_student_count).to eq([bob, gretchen, tristan])
  # end

end