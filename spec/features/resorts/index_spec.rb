require 'rails_helper'

RSpec.describe 'Resorts index' do

  before(:each) do
    @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )
    @copper = Resort.create!(name: 'Copper', city: 'Frisco', runs: 15, ski_only: true)
    @seven_springs = Resort.create!(name: 'Seven Springs', city: 'Champion', runs: 9, ski_only: false)
  end

  it 'shows when each resort was created' do

    visit "/resorts"

    expect(page).to have_content(@breck.created_at)
    expect(page).to have_content(@copper.created_at)
    expect(page).to have_content(@seven_springs.created_at)
  end

  it 'has a button to create a new resort' do
    visit "/resorts"

    expect(page).to have_link("Add New Resort")

    click_link "Add New Resort"

    expect(current_path).to eq("/resorts/new")
  end

  it 'has a can link to edit the resort information' do

    visit '/resorts'

    expect(page).to have_button("Edit #{@breck.name}")

    click_button "Edit #{@breck.name}"

    expect(current_path).to eq("/resorts/#{@breck.id}/edit")
    expect(current_path).to_not eq("/resorts/#{@copper.id}/edit")
    expect(current_path).to_not eq("/resorts/#{@seven_springs.id}/edit")
  end
end
