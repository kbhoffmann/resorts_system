require 'rails_helper'

RSpec.describe "Pass holders index" do
  before(:each) do
    @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false)
    @kerri = @breck.pass_holders.create!(name: 'Kerri', age: 11, level: 'beginner', season_pass: true)
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
    expect(page).to_not have_content(@dana.level)
    expect(page).to_not have_content(@dana.age)
    expect(page).to_not have_content(@dana.season_pass)
    expect(page).to_not have_content(@rob.name)
    expect(page).to_not have_content(@rob.level)
    expect(page).to_not have_content(@rob.age)
    expect(page).to_not have_content(@rob.season_pass)
  end
end
