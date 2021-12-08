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

  it 'links to viewing a student' do
    hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
    gretchen = hans.students.create!(name: 'Gretchen', age: 20, subject: "cross-country skiing", returning_student: true, level:"advanced")
    tristan = hans.students.create!(name: 'Tristan', age: 14, subject: "snowboarding", returning_student: false, level:"advanced")
    bob = hans.students.create!(name: 'Bob', age: 21, subject: "skiing", returning_student: false, level:"advanced")

    visit "/instructors/#{hans.id}/students"
    click_button "View Gretchen"

    expect(current_path).to eq("/students/#{gretchen.id}")
  end

  it 'links to editing a student' do
    hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
    gretchen = hans.students.create!(name: 'Gretchen', age: 20, subject: "cross-country skiing", returning_student: true, level:"advanced")
    tristan = hans.students.create!(name: 'Tristan', age: 14, subject: "snowboarding", returning_student: false, level:"advanced")
    bob = hans.students.create!(name: 'Bob', age: 21, subject: "skiing", returning_student: false, level:"advanced")

    visit "/instructors/#{hans.id}/students"
    click_button "Edit Gretchen"

    expect(current_path).to eq("/students/#{gretchen.id}/edit")
  end

  it 'sorts the students by name via query parameter' do
    hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
    gretchen = hans.students.create!(name: 'Gretchen', age: 20, subject: "cross-country skiing", returning_student: true, level:"advanced")
    tristan = hans.students.create!(name: 'Tristan', age: 14, subject: "snowboarding", returning_student: false, level:"advanced")
    bob = hans.students.create!(name: 'Bob', age: 21, subject: "skiing", returning_student: false, level:"advanced")

    visit "/instructors/#{hans.id}/students"
    click_link "Sort Students By Name"

    expect(current_path).to eq("/instructors/#{hans.id}/students")

    expect(bob.name).to appear_before(gretchen.name)
    expect(gretchen.name).to appear_before(tristan.name)
  end

  it 'filters student records: display only those over a user-provided age threshold' do
    hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
    gretchen = hans.students.create!(name: 'Gretchen', age: 20, subject: "cross-country skiing", returning_student: true, level:"advanced")
    tristan = hans.students.create!(name: 'Tristan', age: 14, subject: "snowboarding", returning_student: false, level:"advanced")
    bob = hans.students.create!(name: 'Bob', age: 21, subject: "skiing", returning_student: false, level:"advanced")

    visit "/instructors/#{hans.id}/students"

    fill_in(:min_age, with: 18)
    click_button("Filter")
    
    expect(current_path).to eq("/instructors/#{hans.id}/students")
    expect(page).to have_content(gretchen.name)
    expect(page).to have_content(bob.name)
  end

end