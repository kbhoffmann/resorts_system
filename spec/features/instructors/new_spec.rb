require 'rails_helper'

# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

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