require 'rails_helper'

RSpec.describe 'Instructor students edit' do

  before(:each) do
    @instructor = Instructor.create(name: "Hans", subject: "skiing", years_experience: 20, teaches_children: true)
    @student = @instructor.students.create(name: "Mary", subject: "skiing", age: 10, returning_student: false, level: "intermediate")
  end

  it 'links to the edit page' do
    visit "/students/#{@student.id}"

    click_link("Update #{@student.name}")

    expect(current_path).to eq("/students/#{@student.id}/edit")
  end

  it 'can edit the student information' do
    visit "/students/#{@student.id}"

    expect(page).to have_content("Mary")
    click_link("Update #{@student.name}")

    fill_in(:name, with: "MaryBeth")
    click_button("Update #{@student.name}")

    expect(current_path).to eq("/students/#{@student.id}")
    expect(page).to have_content("MaryBeth")
  end



end