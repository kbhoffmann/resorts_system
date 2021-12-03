require 'rails_helper'

RSpec.describe Instructor do
  it {should have_many :students}

  it 'shows instructors ordered by most recently created' do
    gretchen = Instructor.create!(name: 'Gretchen', subject: "cross-country skiing", teaches_children: true, years_experience:10)
    tristan = Instructor.create!(name: 'Tristan', subject: "snowboarding", teaches_children: false, years_experience:8)
    bob = Instructor.create!(name: 'Bob', subject: "skiing", teaches_children: false, years_experience:12)

    expect(Instructor.ordered_by_created_at).to eq( [bob, tristan, gretchen])
  end

end