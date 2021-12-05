require 'rails_helper'

RSpec.describe 'Resorts pass holder index' do

  before(:each) do
    @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false)
    @jerry = @breck.pass_holders.create!(name: 'Jerry', age: 63, level: 'intermediate', season_pass: true)
    @kevin = @breck.pass_holders.create!(name: 'Kevin', age: 43, level: 'intermediate', season_pass: true)
    @kerri = @breck.pass_holders.create!(name: 'Kerri', age: 11, level: 'beginner', season_pass: true)
    @dana = @breck.pass_holders.create!(name: 'Dana', age: 31, level: 'intermediate', season_pass: true)
  end

  it 'shows all of the names for pass_holders at a given resort' do
    visit "/resorts/#{@breck.id}/pass_holders"

    expect(page).to have_content(@jerry.name)
    expect(page).to have_content(@kevin.name)
  end

  it 'has a link to sort all the passholders in alphabetical order' do
    visit "/resorts/#{@breck.id}/pass_holders"

    click_link('Sort Passholders Alphabetically')

    expect(@dana.name).to appear_before(@jerry.name)
  end
end
