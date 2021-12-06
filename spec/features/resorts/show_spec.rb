require 'rails_helper'

RSpec.describe 'the resorts show page' do

  it 'displays the resort attributes' do
    resort = Resort.create!(name: "Winter Park", runs: 20, ski_only: true, city: "Winter Park")

    visit "/resorts/#{resort.id}"

    expect(page).to have_content(resort.name)
    expect(page).to have_content(resort.id)
    expect(page).to have_content(resort.city)
    expect(page).to have_content(resort.ski_only)
    expect(page).to have_content(resort.runs)
    expect(page).to have_content(resort.created_at)
    expect(page).to have_content(resort.updated_at)
  end

  it 'shows the count of the number of pass_holders for the resort' do
    winterpark = Resort.create!(name: "Winter Park", runs: 20, ski_only: true, city: "Winter Park")
    breck = Resort.create!(name: "Breckenridge", runs: 57, ski_only: false, city: "Breckenridge")
    winterpark.pass_holders.create!(name: "Hannah Warren", level: "beginner", age: 21, season_pass: false)
    winterpark.pass_holders.create!(name: "Kerri Hoffmann", level: "advanced", age: 21, season_pass: false)

    visit "/resorts/#{winterpark.id}"

    expect(page).to have_content("Number of Passholders: #{winterpark.pass_holders.count}")
    expect(page).to_not have_content("Number of Passholders: #{breck.pass_holders.count}")
  end

  it 'has a link to resorts pass_holders' do
    winterpark = Resort.create!(name: "Winter Park", runs: 20, ski_only: true, city: "Winter Park")
    breck = Resort.create!(name: "Breckenridge", runs: 57, ski_only: false, city: "Breckenridge")

    visit "/resorts/#{winterpark.id}"

    expect(page).to have_link("Passholders for this Resort")

    click_on "Passholders for this Resort"

    expect(current_path).to eq("/resorts/#{winterpark.id}/pass_holders")
    expect(current_path).to_not eq("/resorts/#{breck.id}/pass_holders")
  end

  it 'has a can link to edit the resort information' do
    resort = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )

    visit "/resorts/#{resort.id}"

    expect(page).to have_button("Edit #{resort.name}")

    click_button "Edit #{resort.name}"

    expect(current_path).to eq("/resorts/#{resort.id}/edit")
  end
end
