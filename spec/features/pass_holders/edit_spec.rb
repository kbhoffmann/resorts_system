require 'rails_helper'

RSpec.describe 'the Passholder Update' do
  before(:each) do
    @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false)
    @kerri = @breck.pass_holders.create!(name: 'Kerri', age: 11, level: 'beginner', season_pass: true)
    @rob = @breck.pass_holders.create!(name: 'Rob', age: 40, level: 'advanced', season_pass: false)
    @hannah = @breck.pass_holders.create!(name: 'Hannahh', age: 31, level: 'intermediate', season_pass: false)
  end

  it 'links to edit passholder information page' do

    visit "/pass_holders/#{@rob.id}"

    click_button "Update #{@rob.name}"

    expect(current_path).to eq("/pass_holders/#{@rob.id}/edit")
    expect(current_path).to_not eq("/pass_holders/#{@hannah.id}/edit")
    expect(current_path).to_not eq("/pass_holders/#{@kerri.id}/edit")
  end

  it 'can edit the passholder' do

    visit "/pass_holders/#{@hannah.id}"

    expect(page).to have_content('Hannahh')
    expect(page).to have_content('intermediate')
    expect(page).to have_content(31)
    expect(page).to have_content(false)
    expect(page).to_not have_content("Kerri")
    expect(page).to_not have_content("Rob")

    click_button 'Update Hannah'

    fill_in 'Name', with: 'Hannah'
    fill_in 'Level', with: 'beginner'
    fill_in 'Age', with: 23
    fill_in 'season_pass', with: true

    click_button "Update Passholder"

    expect(current_path).to eq("/pass_holders/#{@hannah.id}")
    expect(current_path).to_not eq("/pass_holders/#{@kerri.id}")
    expect(current_path).to_not eq("/pass_holders/#{@rob.id}")
    expect(page).to have_content('Hannah')
    expect(page).to have_content('beginner')
    expect(page).to have_content(23)
    expect(page).to have_content(true)
    expect(page).to_not have_content("Hannahh")
    expect(page).to_not have_content('intermediate')
    expect(page).to_not have_content(31)
    expect(page).to_not have_content(false)
    expect(page).to_not have_content("Kerri")
    expect(page).to_not have_content("Rob")
  end
end
