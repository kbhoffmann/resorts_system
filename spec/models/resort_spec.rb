require 'rails_helper'

RSpec.describe Resort do
  describe 'Resort index' do
    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created
    it 'shows resorts ordered by most recently created' do
      breck = Resort.create!(name: 'Breckenridge', city: 'Breckenridge', runs: 20, ski_only: false )
      copper = Resort.create!(name: 'Copper', city: 'Frisco', runs: 15, ski_only: true)
      seven_springs = Resort.create!(name: 'Seven Springs', city: 'Champion', runs: 9, ski_only: false)

      expect(Resort.ordered_by_created_at).to eq([breck, copper, seven_springs])
    end

    it 'shows when resort was created' do
  end


  end

  describe 'relationships'
  describe 'validations'
  describe 'class methods'
end
