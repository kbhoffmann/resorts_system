require 'rails_helper'

RSpec.describe 'the Pass Holder Creation' do
  it 'links to the new page from the resort passholders index' do
    resort = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )

    visit "/resorts/#{resort.id}/resort_pass_holders"

    click_link('New Passholder')
  
    expect(current_path).to eq("/resorts/#{resort.id}/resort_pass_holders/new")
  end

  it 'can create a new passholder' do
    resort = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )
    passholder = resort.pass_holders.create!(name: "Kelsey", age: 38, level: 'intermediate', season_pass: true)

    visit "/resorts/#{resort.id}/resort_pass_holders/new"

    fill_in('Name', with: "Kelsey")
    click_button('Create New Passholder')

    expect(current_path).to eq("/resorts/#{resort.id}/resort_pass_holders")

    expect(page).to have_content("Kelsey")
    expect(page).to have_content(38)
    expect(page).to have_content("intermediate")
    expect(page).to have_content(true)
  end
end
