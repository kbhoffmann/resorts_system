require 'rails_helper'

RSpec.describe 'Instructor edit' do

  it 'can edit and update the instructor information' do
    instructor = Instructor.create!(name: "Olg", subject: "skiing", teaches_children: false, years_experience: 5)

    visit "/instructors"

    expect(page).to have_content("Olg")
    click_button("Edit Olg")

    expect(page).to have_field("Name", with: "Olg")
    fill_in(:name, with: "Olga")
    click_button("Update Instructor")

    expect(current_path).to eq("/instructors")
    expect(page).to have_content("Olga")
  end


end