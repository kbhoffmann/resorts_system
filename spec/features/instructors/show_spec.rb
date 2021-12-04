require 'rails_helper'

RSpec.describe 'the instructors show page' do

  it 'displays the instructor attributes' do

    instructor = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)

    visit "/instructors/#{instructor.id}"

    expect(page).to have_content(instructor.name)
    expect(page).to have_content(instructor.id)
    expect(page).to have_content(instructor.subject)
    expect(page).to have_content(instructor.teaches_children)
    expect(page).to have_content(instructor.years_experience)
    expect(page).to have_content(instructor.created_at)
    expect(page).to have_content(instructor.updated_at)
  end

  it 'shows the count of number of students for the instructor' do
    hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
    rob = Instructor.create!(name: "Hans", subject: "snowboarding", teaches_children: false, years_experience: 25)
    gretchen = hans.students.create!(name: 'Gretchen', age: 20, subject: "skiing", returning_student: true, level:"advanced")
    tristan = hans.students.create!(name: 'Tristan', age: 34, subject: "skiing", returning_student: false, level:"advanced")

    visit "/instructors/#{hans.id}"

    expect(page).to have_content("Number of Students: #{hans.students.count}")
    expect(page).to_not have_content("Number of Students: #{rob.students.count}")
  end

  it 'has a link to students for the instructor' do
    hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
    rob = Instructor.create!(name: "Hans", subject: "snowboarding", teaches_children: false, years_experience: 25)

    visit "/instructors/#{hans.id}"

    expect(page).to have_link("Students for this Instructor")

    click_on "Students for this Instructor"

    expect(current_path).to eq("/instructors/#{hans.id}/students")
    expect(current_path).to_not eq("/instructors/#{rob.id}/students")
  end
end
