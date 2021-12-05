require 'rails_helper'

RSpec.describe 'the Pass Holder Creation' do
  it 'links to the new page from the resort passholders index' do
    resort = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )

    visit "/resorts/#{resort.id}/resort_pass_holders"

    click_link('New Passholder')
    # new_resort_id = Resort.last.id
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

# User Story 13, REsort Passholder Creation (x2)
# ---------------------------------------
# As a visitor
# When I visit a REsort Passholders Index page*
# Then I see a link to add a new passholder for that resort "Create Passholder"*
# When I click the link*
# I am taken to '/resorts/:resort_id/passholder_table_name/new' where I see a form to add a new adoptable passholder*
# When I fill in the form with the passholder's attributes: *
# And I click the button "Create Passholder" *
# Then a `POST` request is sent to '/resorts/:resort_id/passholder_table_name',
# a new passholder object/row is created for that resort,
# and I am redirected to the REsort Passholders Index page where I can see the new passholder listed


# t.string "name"
# t.integer "age"
# t.string "level"
# t.boolean "season_pass"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.bigint "resort_id"
# t.index ["resort_id"], name: "index_pass_holders_on_resort_id"
