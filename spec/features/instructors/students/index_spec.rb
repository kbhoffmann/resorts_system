require 'rails_helper'

RSpec.describe "Instructor's students index" do

  it 'shows all of the names for students of a given instructor' do
    hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
    gretchen = hans.students.create!(name: 'Gretchen', age: 20, subject: "cross-country skiing", returning_student: true, level:"advanced")
    tristan = hans.students.create!(name: 'Tristan', age: 14, subject: "snowboarding", returning_student: false, level:"advanced")
    bob = hans.students.create!(name: 'Bob', age: 21, subject: "skiing", returning_student: false, level:"advanced")

    visit "/instructors/#{hans.id}/students"

    expect(page).to have_content(gretchen.name)
    expect(page).to have_content(bob.name)
  end

end