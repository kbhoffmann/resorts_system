require 'rails_helper'

RSpec.describe 'destorying a pass holder' do
  it 'can delete the pass holder from the index page' do
    mammoth = Resort.create!(name: 'Mammoth Mountain', city: 'Mammoth Lakes', runs: 65, ski_only: false )
    kerri = mammoth.pass_holders.create!(name: 'Kerri', age: 11, level: 'beginner', season_pass: true)
    rob = mammoth.pass_holders.create!(name: 'Rob', age: 40, level: 'advanced', season_pass: true)
    dana = mammoth.pass_holders.create!(name: 'Dana', age: 31, level: 'intermediate', season_pass: true)

  visit "/pass_holders/#{kerri.id}"

  click_button "Delete #{kerri.name}"

  expect(current_path).to eq("/pass_holders")
  expect(page).to_not have_content("Kerri")
  expect(page).to have_content("Rob")
  expect(page).to have_content("Dana")
  end
end
