require 'rails_helper'

RSpec.describe 'destorying a resort' do

  it 'can delete the resort from the show page' do
    mammoth = Resort.create!(name: 'Mammoth Mountain', city: 'Mammoth Lakes', runs: 65, ski_only: false )
    kerri = mammoth.pass_holders.create!(name: 'Kerri', age: 11, level: 'beginner', season_pass: true)
    rob = mammoth.pass_holders.create!(name: 'Rob', age: 40, level: 'advanced', season_pass: false)
    dana = mammoth.pass_holders.create!(name: 'Dana', age: 31, level: 'intermediate', season_pass: false)

  visit "/resorts/#{mammoth.id}"

  click_button "Delete #{mammoth.name}"

  expect(current_path).to eq("/resorts")
  expect(page).to_not have_content('Mammoth Mountain')

  visit "/pass_holders"

  expect(page).to_not have_content("Kerri")
  expect(page).to_not have_content("Rob")
  expect(page).to_not have_content("Dana")
  end
end
