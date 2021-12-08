require 'rails_helper'

RSpec.describe PassHolder do
  before(:each) do
    @breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )

    @jerry = @breck.pass_holders.create!(name: 'Jerry Seinfeld', age: 63, level: 'intermediate', season_pass: true)
    @kevin = @breck.pass_holders.create!(name: 'Kevin Hart', age: 43, level: 'advanced', season_pass: false)
    @dana = @breck.pass_holders.create!(name: 'Dana', age: 15, level: 'intermediate', season_pass: true)
    @kerri = @breck.pass_holders.create!(name: 'Kerri', age: 10, level: 'beginner', season_pass: false)
  end

  it {should belong_to :resort}

  it 'sorts passholders alphabetically' do

    expect(PassHolder.sort_name_alphabetically).to eq([@dana, @jerry, @kerri, @kevin])
    expect(PassHolder.sort_name_alphabetically).to_not eq([@kevin, @kerri, @jerry, @dana])
    expect(PassHolder.sort_name_alphabetically).to_not eq([@jerry, @kevin, @dana, @kerri])
  end

  it 'only shows passholders who have season passes' do

    expect(PassHolder.true_only).to eq([@jerry, @dana])
    expect(PassHolder.true_only).to_not eq([@kevin, @kerri])
  end

  it 'only shows passholders of a certain age' do

    expect(PassHolder.minimum_age(60)).to eq([@jerry])
    expect(PassHolder.minimum_age(60)).to_not eq([@dana, @kerri])
    expect(PassHolder.minimum_age(14)).to eq([@jerry, @kevin, @dana])
    expect(PassHolder.minimum_age(14)).to_not eq([@kerri])
  end
end
