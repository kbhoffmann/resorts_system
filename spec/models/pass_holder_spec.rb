require 'rails_helper'

RSpec.describe PassHolder do
  it {should belong_to :resort}

  it 'sorts passholders alphabetically' do
    breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )

    jerry = breck.pass_holders.create!(name: 'Jerry Seinfeld', age: 63, level: 'intermediate', season_pass: true)
    kevin = breck.pass_holders.create!(name: 'Kevin Hart', age: 43, level: 'advanced', season_pass: true)
    dana = breck.pass_holders.create!(name: 'Dana', age: 30, level: 'intermediate', season_pass: true)
    kerri = breck.pass_holders.create!(name: 'Kerri', age: 10, level: 'beginner', season_pass: true)

    expect(PassHolder.sort_name_alphabetically).to eq([dana,kerri,kevin,jerry])
  end
end
