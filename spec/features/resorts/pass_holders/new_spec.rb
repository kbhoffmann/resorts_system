require 'rails_helper'

RSpec.describe 'the Pass Holder Creation' do

  before(:each) do
    @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false)
    @park_city = Resort.create!(name: 'Park City', city: 'Park City', runs: 30, ski_only: false)
  end

  it 'links to the new passholder form page from the resort passholders index' do

    visit "/resorts/#{@breck.id}/resort_pass_holders"

    click_link('New Passholder')

    expect(current_path).to eq("/resorts/#{@breck.id}/resort_pass_holders/new")
    expect(current_path).to_not eq("/resorts/#{@park_city.id}/resort_pass_holders/new")
  end

  it 'can create a new passholder' do

    visit "/resorts/#{@breck.id}/resort_pass_holders/new"

    fill_in('name', with: "Kelsey")
    fill_in('age', with: 38)
    fill_in('level', with: "intermediate")
    fill_in('season_pass', with: true)

    click_button('Create New Passholder')

    expect(current_path).to eq("/resorts/#{@breck.id}/resort_pass_holders")
    expect(current_path).to_not eq("/resorts/#{@park_city.id}/resort_pass_holders")

    expect(page).to have_content("Kelsey")
    expect(page).to have_content(38)
    expect(page).to have_content("intermediate")
    expect(page).to have_content(true)
    expect(page).to_not have_content(false)
  end
end
