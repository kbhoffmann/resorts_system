require 'rails_helper'

RSpec.describe 'the pass holders show page' do

  before(:each) do
    @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false)
    @kerri = @breck.pass_holders.create!(name: 'Kerri', age: 11, level: 'beginner', season_pass: true)
    @rob = @breck.pass_holders.create!(name: 'Rob', age: 40, level: 'advanced', season_pass: false)
    @dana = @breck.pass_holders.create!(name: 'Dana', age: 31, level: 'intermediate', season_pass: false)
  end

  it 'displays the pass holder attributes' do
    visit "/pass_holders/#{@kerri.id}"

    expect(page).to have_content(@kerri.id)
    expect(page).to have_content(@kerri.name)
    expect(page).to have_content(@kerri.level)
    expect(page).to have_content(@kerri.age)
    expect(page).to have_content(@kerri.season_pass)
    expect(page).to have_content(@kerri.created_at)
    expect(page).to have_content(@kerri.updated_at)

    expect(page).to_not have_content(@dana.name)
    expect(page).to_not have_content(@rob.age)
    expect(page).to_not have_content(@dana.name)
    expect(page).to_not have_content(@rob.age)
  end

  it 'has a button to delete a pass holder' do

    visit "/pass_holders/#{@kerri.id}"
    save_and_open_page

    expect(page).to have_button("Delete #{@kerri.name}")
    expect(page).to_not have_button("Delete #{@dana.name}")
    expect(page).to_not have_button("Delete #{@rob.name}")
  end
end
