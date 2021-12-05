require 'rails_helper'

RSpec.describe 'the Passholder Update' do
  it 'links to edit passholder information page' do
    resort = Resort.create!(name: "Winter Park", runs: 20, ski_only: true, city: "Winter Park")
    pass_holder = resort.pass_holders.create!(name: "Hannah Warren", level: "beginner", age: 21, season_pass: false)
    # pass_holder2 = resort.pass_holders.create!(name: "Kerri Hoffmann", level: "advanced", age: 21, season_pass: false)

    visit "/pass_holders/#{pass_holder.id}"

    click_button "Update #{pass_holder.name}"

    expect(current_path).to eq("/pass_holders/#{pass_holder.id}/edit")
  end

  it 'can edit the passholder' do
    resort = Resort.create!(name: "Winter Park", runs: 20, ski_only: true, city: "Winter Park")
    pass_holder = resort.pass_holders.create!(name: "Hannah", level: "beginner", age: 21, season_pass: false)

    visit "/pass_holders/#{pass_holder.id}"

    expect(page).to have_content('Hannah')
    expect(page).to have_content('beginner')
    expect(page).to have_content(21)
    expect(page).to have_content(false)

    click_button 'Update Hannah'

    fill_in 'Name', with: 'Hannah Warren'
    fill_in 'Level', with: 'intermediate'
    fill_in 'Age', with: 33
    fill_in 'season_pass', with: true

    click_button "Update Passholder"

    expect(current_path).to eq("/pass_holders/#{pass_holder.id}")
    expect(page).to have_content('Hannah Warren')
    expect(page).to have_content('intermediate')
    expect(page).to have_content(33)
    expect(page).to have_content(true)
  end
end

# User Story 14, Child Update (x2)
# ----------------------------
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:

# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
