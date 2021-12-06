require 'rails_helper'

RSpec.describe 'the pass holders show page' do
  @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false)
  @dana = @breck.pass_holders.create!(name: 'Dana', age: 31, level: 'intermediate', season_pass: true)
  @kerri = @park_city.pass_holders.create!(name: 'Kerri', age: 11, level: 'beginner', season_pass: true)

  it 'displays the pass holder attributes' do
    visit "/pass_holders/#{kerri.id}"

    expect(page).to have_content(kerri.id)
    expect(page).to have_content(kerri.name)
    expect(page).to have_content(kerri.level)
    expect(page).to have_content(kerri.age)
    expect(page).to have_content(kerri.season_pass)
    expect(page).to have_content(kerri.created_at)
    expect(page).to have_content(kerri.updated_at)

    expect(page).to_not have_content(dana.name)
  end
end
