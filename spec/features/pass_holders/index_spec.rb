require 'rails_helper'

RSpec.describe "Pass holders index" do
  before(:each) do
    @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false)
    @kerri = @breck.pass_holders.create!(name: 'Kerri', age: 11, level: 'beginner', season_pass: true)
    @eric = @breck.pass_holders.create!(name: 'Eric', age: 25, level: 'intermediate', season_pass: true)
    @rob = @breck.pass_holders.create!(name: 'Rob', age: 40, level: 'advanced', season_pass: false)
    @dana = @breck.pass_holders.create!(name: 'Dana', age: 31, level: 'intermediate', season_pass: false)
  end

  it 'shows only records where season_pass is true' do
    visit '/pass_holders'

    expect(page).to have_content(@kerri.name)
    expect(page).to have_content(@kerri.level)
    expect(page).to have_content(@kerri.age)
    expect(page).to have_content(@kerri.season_pass)
    expect(page).to have_content(@kerri.created_at)
    expect(page).to have_content(@kerri.updated_at)

    expect(page).to_not have_content(@dana.name)
    expect(page).to_not have_content(@rob.name)
  end

  it 'has a button to update the passholder information' do
    visit '/pass_holders'

    expect(page).to have_button("Update #{@kerri.name}")
    expect(page).to have_button("Update #{@eric.name}")
    expect(page).to_not have_button("Update #{@dana.name}")
    expect(page).to_not have_button("Update #{@rob.name}")

    click_button("Update #{@kerri.name}")

    expect(current_path).to eq("/pass_holders/#{@kerri.id}/edit")
  end
end
