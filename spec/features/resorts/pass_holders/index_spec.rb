require 'rails_helper'

RSpec.describe 'Resorts pass holder index' do

  before(:each) do
    @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false)
    @park_city = Resort.create!(name: 'Park City', city: 'Park City', runs: 30, ski_only: false)
    @jerry = @breck.pass_holders.create!(name: 'Jerry', age: 33, level: 'intermediate', season_pass: true)
    @kevin = @breck.pass_holders.create!(name: 'Kevin', age: 25, level: 'intermediate', season_pass: true)
    @dana = @breck.pass_holders.create!(name: 'Dana', age: 17, level: 'intermediate', season_pass: true)
    @kerri = @park_city.pass_holders.create!(name: 'Kerri', age: 11, level: 'beginner', season_pass: true)
  end

  it 'shows all of the names for pass_holders at a given resort' do
    visit "/resorts/#{@breck.id}/pass_holders"

    expect(page).to have_content(@jerry.name)
    expect(page).to have_content(@kevin.name)
    expect(page).to_not have_content(@kerri.name)
  end

  it 'has a button to update a passholder information' do

    visit "/resorts/#{@breck.id}/pass_holders"

    expect(page).to have_button("Update #{@jerry.name}")
    expect(page).to have_button("Update #{@dana.name}")
    expect(page).to_not have_button("Update #{@kerri.name}")

    click_button("Update #{@jerry.name}")

    expect(current_path).to eq("/pass_holders/#{@jerry.id}/edit")
  end

  it 'has a button to delete a passholder' do
    visit "/resorts/#{@breck.id}/pass_holders"

    expect(page).to have_button("Delete #{@jerry.name}")
    expect(page).to have_button("Delete #{@dana.name}")
    expect(page).to_not have_button("Delete #{@kerri.name}")

    click_button("Delete #{@jerry.name}")

    expect(current_path).to eq("/pass_holders")
  end

  it 'has a link to sort all the passholders in alphabetical order' do
    visit "/resorts/#{@breck.id}/pass_holders"

    click_link('Sort Passholders Alphabetically')

    expect(@dana.name).to appear_before(@jerry.name)
    expect(@jerry.name).to_not appear_before(@dana.name)
  end

  it 'has a form to limit the amount of records displayed' do
    visit "/resorts/#{@breck.id}/pass_holders"

    fill_in :min_age, with: 17

    click_on "Return records with pass holders greater than specified age"

    expect(current_path).to eq("/resorts/#{@breck.id}/pass_holders")
    expect(page).to_not have_content('Dana')
    expect(page).to_not have_content('Kerri')
    expect(page).to have_content('Jerry')
    expect(page).to have_content('Kevin')
  end
end
