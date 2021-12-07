require 'rails_helper'

RSpec.describe "Students index" do

  it 'shows only returning students' do
    hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
    gretchen = hans.students.create!(name: 'Gretchen', age: 20, subject: "cross-country skiing", returning_student: true, level:"advanced")
    tristan = hans.students.create!(name: 'Tristan', age: 14, subject: "snowboarding", returning_student: false, level:"advanced")

    visit '/students'

    expect(page).to have_content(gretchen.name)
    expect(page).to have_content(gretchen.subject)
    expect(page).to have_content(gretchen.age)
    expect(page).to have_content(gretchen.level)
    expect(page).to have_content(gretchen.returning_student)
    expect(page).to have_content(gretchen.created_at)
    expect(page).to have_content(gretchen.updated_at)

    expect(page).to_not have_content(tristan.name)
  end

  it 'links to student show view' do
    hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
    gretchen = hans.students.create!(name: 'Gretchen', age: 20, subject: "cross-country skiing", returning_student: true, level:"advanced")
    tristan = hans.students.create!(name: 'Tristan', age: 14, subject: "snowboarding", returning_student: false, level:"advanced")
    bob = hans.students.create!(name: 'Bob', age: 21, subject: "skiing", returning_student: false, level:"advanced")

    visit "/students"
    click_button "View Gretchen"

    expect(current_path).to eq("/students/#{gretchen.id}")
  end

  it 'links to student edit view' do
    hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
    gretchen = hans.students.create!(name: 'Gretchen', age: 20, subject: "cross-country skiing", returning_student: true, level:"advanced")
    tristan = hans.students.create!(name: 'Tristan', age: 14, subject: "snowboarding", returning_student: false, level:"advanced")
    bob = hans.students.create!(name: 'Bob', age: 21, subject: "skiing", returning_student: false, level:"advanced")

    visit "/instructors/#{hans.id}/students"
    click_button "Edit Gretchen"

    expect(current_path).to eq("/students/#{gretchen.id}/edit")
  end

end