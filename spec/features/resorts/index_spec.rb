require 'rails_helper'

RSpec.describe 'Resorts index' do
  it 'shows when each resort was created' do
      breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )
      copper = Resort.create!(name: 'Copper', city: 'Frisco', runs: 15, ski_only: true)
      seven_springs = Resort.create!(name: 'Seven Springs', city: 'Champion', runs: 9, ski_only: false)
      visit "/resorts"

    expect(page).to have_content(breck.created_at)
    expect(page).to have_content(copper.created_at)
    expect(page).to have_content(seven_springs.created_at)
  end

  # xit 'has a link to create a new Resort record'
  #  visit "/resorts/index"
        # Then I see a link to create a new Parent record, "New Parent"
        # When I click this link
        # Then I am taken to '/parents/new' where I  see a form for a new parent record
    # expect(page).to have_link("New Resort")
    # expect(current_path).to eq('/resorts/new')

  # Then I am taken to '/parents/new' where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
end



# User Story 11, Parent Creation (x2)
# As a visitor
#---------------------
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
