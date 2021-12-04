require 'rails_helper'

RSpec.describe 'the resort edit' do
  it 'links to the edit page' do
    resort = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )

    visit '/resorts'

    click_button "Edit #{resort.name}"

    expect(current_path).to eq("/resorts/#{resort.id}/edit")
  end

  it 'can edit the resort' do
    resort = Resort.create!(name: 'Breckenrid', city: 'Breck', runs: 99, ski_only: true )

    visit "/resorts"

    expect(page).to have_content('Breckenrid')
    expect(page).to have_content('Breck')
    expect(page).to have_content(99)
    expect(page).to have_content(true)

    click_button 'Edit Breckenrid'

    fill_in 'Name', with: 'Breckenridge'
    fill_in 'City', with: 'Breckenridge'
    fill_in 'Runs', with: 27
    fill_in 'Ski only', with: false
    click_button "Update Resort"

    expect(current_path).to eq("/resorts")
    expect(page).to have_content('Breckenridge')
    expect(page).to have_content('Breckenridge')
    expect(page).to have_content(27)
    expect(page).to have_content(false)
  end
end
