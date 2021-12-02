require 'rails_helper'

RSpec.describe 'Resorts pass holder index' do

  before(:each) do
    @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false)
    @jerry = @breck.pass_holders.create!(name: 'Jerry Seinfeld', age: 63, level: 'intermediate', season_pass: true)
    @kevin = @breck.pass_holders.create!(name: 'Kevin Hart', age: 43, level: 'intermediate', season_pass: false)
  end

  it 'shows all of the names for pass_holders at a given resort' do
    visit "/resorts/#{@breck.id}/pass_holders"

    expect(page).to have_content(@jerry.name)
    expect(page).to have_content(@kevin.name)
  end
end