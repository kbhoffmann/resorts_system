require 'rails_helper'

RSpec.describe 'Resorts index' do
  it 'shows when each resort was created' do
      breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )
      copper = Resort.create!(name: 'Copper', city: 'Frisco', runs: 15, ski_only: true)
      seven_springs = Resort.create!(name: 'Seven Springs', city: 'Champion', runs: 9, ski_only: false)
      visit "/resorts"

    expect(page).to have_content(breck.created_at)
    expect(page).to have_content(copper.created_at)
    expect(page).to have_content(seven_springs.created_at)
  end
end
