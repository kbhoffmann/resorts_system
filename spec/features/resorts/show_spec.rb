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

end