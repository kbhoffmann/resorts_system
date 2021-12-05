require 'rails_helper'

RSpec.describe 'Create new instructor' do

  it 'links to the new page from the instructors index' do
    visit '/instructors'

    click_link('New Instructor')
    expect(current_path).to eq('/instructors/new')
  end

  it 'can create a new instructor' do
    visit '/instructors/new'

    fill_in(:name, with: 'Sven')
    fill_in(:subject, with: 'Cross-Country Skiing')
    check :teaches_children
    fill_in(:years_experience, with: 10)
    click_button('Create Instructor')

    expect(current_path).to eq("/instructors")
    expect(page).to have_content('Sven')
  end
end
