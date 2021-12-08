require 'rails_helper'

RSpec.describe 'Instructors index' do

  it 'sorts parents by number of children' do
    gretchen = Instructor.create!(name: 'Gretchen', subject: "cross-country skiing", teaches_children: true, years_experience:10)
    sally = gretchen.students.create!(name: 'Sally', subject: "cross-country skiing", returning_student: true, age: 10, level: "intermediate")
    billy = gretchen.students.create!(name: 'Billy', subject: "cross-country skiing", returning_student: false, age: 18, level: "intermediate")

    tristan = Instructor.create!(name: 'Tristan', subject: "snowboarding", teaches_children: false, years_experience:8)
    seth = tristan.students.create!(name: 'Seth', subject: "snowboarding", returning_student: false, age: 15, level: "beginner")

    bob = Instructor.create!(name: 'Bob', subject: "skiing", teaches_children: false, years_experience:12)
    beth = bob.students.create!(name: 'Beth', subject: "skiing", returning_student: false, age: 15, level: "beginner")
    carly = bob.students.create!(name: 'Carly', subject: "skiing", returning_student: false, age: 15, level: "beginner")
    andy = bob.students.create!(name: 'Andy', subject: "snowboarding", returning_student: false, age: 15, level: "beginner")

    visit "/instructors"
    
    click_link("Sort instructors by number of students")

    expect(page).to have_content(bob.name)
    expect(page).to have_content(gretchen.name)
    expect(page).to have_content(tristan.name)

    expect(bob.name).to appear_before(gretchen.name)
    expect(gretchen.name).to appear_before(tristan.name)
  end
  
  it 'shows when each instructor record was created' do
    gretchen = Instructor.create!(name: 'Gretchen', subject: "cross-country skiing", teaches_children: true, years_experience:10)
    tristan = Instructor.create!(name: 'Tristan', subject: "snowboarding", teaches_children: false, years_experience:8)
    bob = Instructor.create!(name: 'Bob', subject: "skiing", teaches_children: false, years_experience:12)

    visit "/instructors"

    expect(page).to have_content(gretchen.created_at)
    expect(page).to have_content(tristan.created_at)
    expect(page).to have_content(bob.created_at)

    expect(bob.name).to appear_before(tristan.name)
  end

  it 'links to the instructor show view' do
    instructor = Instructor.create!(name: "Olga", subject: "skiing", teaches_children: false, years_experience: 5)
    visit '/instructors'

    click_button("View #{instructor.name}")
    expect(current_path).to eq("/instructors/#{instructor.id}")
  end

  it 'links to the instructor edit view' do
    instructor = Instructor.create!(name: "Olga", subject: "skiing", teaches_children: false, years_experience: 5)
    visit '/instructors'

    click_button("Edit #{instructor.name}")
    expect(current_path).to eq("/instructors/#{instructor.id}/edit")
  end

  it 'deletes a listed instructor' do
    instructor = Instructor.create!(name: "Olga", subject: "skiing", teaches_children: false, years_experience: 5)
    visit '/instructors'

    click_button("Delete #{instructor.name}")
    expect(current_path).to eq("/instructors")

    expect(page).to_not have_content("Olga")
  end

end