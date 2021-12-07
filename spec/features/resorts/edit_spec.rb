require 'rails_helper'

RSpec.describe 'the resort edit' do

  before(:each) do
    # @breck = Resort.create!(name: 'Breckenrid', city: 'Breck', runs: 99, ski_only: true )
    @copper = Resort.create!(name: 'Copper', city: 'Frisco', runs: 15, ski_only: true)
    @seven_springs = Resort.create!(name: 'Seven Springs', city: 'Champion', runs: 9, ski_only: false)
    # @kerri = @breck.pass_holders.create!(name: 'Kerri', age: 11, level: 'beginner', season_pass: true)
    # @rob = @breck.pass_holders.create!(name: 'Rob', age: 40, level: 'advanced', season_pass: false)
    # @dana = @breck.pass_holders.create!(name: 'Dana', age: 31, level: 'intermediate', season_pass: false)
  end

  it 'links to the edit page' do
    breck = Resort.create!(name: 'Breckenrid', city: 'Breck', runs: 99, ski_only: true )

    visit "/resorts/#{breck.id}"

    click_button "Edit #{breck.name}"

    expect(current_path).to eq("/resorts/#{breck.id}/edit")
    expect(current_path).to_not eq("/resorts/#{@copper.id}/edit")
    expect(current_path).to_not eq("/resorts/#{@seven_springs.id}/edit")
  end

  it 'can edit the resort information' do
    breck = Resort.create!(name: 'Breckenrid', city: 'Breck', runs: 99, ski_only: true )

    visit "/resorts/#{breck.id}"

    expect(page).to have_content('Breckenrid')
    expect(page).to have_content(99)
    expect(page).to have_content(true)

    click_button 'Edit Breckenrid'

    fill_in 'Name', with: 'Breckenridge'
    fill_in 'City', with: 'Breckenridge'
    fill_in 'Runs', with: 27
    fill_in 'Ski only', with: false
    click_button "Update Resort"

    expect(current_path).to eq("/resorts/#{breck.id}")
    expect(current_path).to_not eq("/resorts/#{@copper.id}")
    expect(current_path).to_not eq("/resorts/#{@seven_springs.id}")
    expect(page).to have_content('Breckenridge')
    expect(page).to have_content(27)
    expect(page).to have_content(false)
  end
end
