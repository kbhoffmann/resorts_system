require 'rails_helper'

RSpec.describe Resort do
  it {should have_many :pass_holders}

  describe 'Resort index' do

    it 'shows resorts ordered by most recently created' do
      breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )
      copper = Resort.create!(name: 'Copper', city: 'Frisco', runs: 15, ski_only: true)
      seven_springs = Resort.create!(name: 'Seven Springs', city: 'Champion', runs: 9, ski_only: false)

      expect(Resort.ordered_by_created_at).to eq([breck, copper, seven_springs])
      expect(Resort.ordered_by_created_at).to_not eq([seven_springs, copper, breck])
      expect(Resort.ordered_by_created_at).to_not eq([breck, seven_springs, copper])
    end
  end
  end
