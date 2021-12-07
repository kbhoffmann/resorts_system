require 'rails_helper'

RSpec.describe 'the resorts show page' do

  before(:each) do
    @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )
    @copper = Resort.create!(name: 'Copper', city: 'Frisco', runs: 15, ski_only: true)
    @seven_springs = Resort.create!(name: 'Seven Springs', city: 'Champion', runs: 9, ski_only: false)
    @kerri = @breck.pass_holders.create!(name: 'Kerri', age: 11, level: 'beginner', season_pass: true)
    @rob = @breck.pass_holders.create!(name: 'Rob', age: 40, level: 'advanced', season_pass: false)
    @dana = @breck.pass_holders.create!(name: 'Dana', age: 31, level: 'intermediate', season_pass: false)
  end

  it 'displays the resort attributes' do

    visit "/resorts/#{@breck.id}"

    expect(page).to have_content(@breck.name)
    expect(page).to have_content(@breck.id)
    expect(page).to have_content(@breck.city)
    expect(page).to have_content(@breck.ski_only)
    expect(page).to have_content(@breck.runs)
    expect(page).to have_content(@breck.created_at)
    expect(page).to have_content(@breck.updated_at)

    expect(page).to_not have_content(@copper.name)
    expect(page).to_not have_content(@seven_springs.name)
  end

  it 'shows the count of the number of pass_holders for the resort' do

    visit "/resorts/#{@breck.id}"

    expect(page).to have_content("Number of Passholders: #{@breck.pass_holders.count}")
    expect(page).to_not have_content("Number of Passholders: #{@copper.pass_holders.count}")
    expect(page).to_not have_content("Number of Passholders: #{@seven_springs.pass_holders.count}")
  end

  it 'has a link to resorts pass_holders' do

    visit "/resorts/#{@breck.id}"

    expect(page).to have_link("Passholders for this Resort")

    click_on "Passholders for this Resort"

    expect(current_path).to eq("/resorts/#{@breck.id}/resort_pass_holders")
    expect(current_path).to_not eq("/resorts/#{@copper.id}/resort_pass_holders")
    expect(current_path).to_not eq("/resorts/#{@seven_springs.id}/resort_pass_holders")
  end

  it 'has a can link to edit the resort information' do

    visit "/resorts/#{@breck.id}"

    expect(page).to have_button("Edit #{@breck.name}")
    expect(page).to_not have_button("Edit #{@copper.name}")
    expect(page).to_not have_button("Edit #{@seven_springs.name}")

    click_button "Edit #{@breck.name}"

    expect(current_path).to eq("/resorts/#{@breck.id}/edit")
    expect(current_path).to_not eq("/resorts/#{@copper.id}/edit")
    expect(current_path).to_not eq("/resorts/#{@seven_springs.id}/edit")
  end

  it 'has a button to delete a the resort' do

    visit "/resorts/#{@breck.id}"
    
    expect(page).to have_button("Delete #{@breck.name}")
    expect(page).to_not have_button("Delete #{@copper.name}")
    expect(page).to_not have_button("Delete #{@seven_springs.name}")
   end
end
