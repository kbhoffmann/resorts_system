require 'rails_helper'

RSpec.describe 'Instructors index' do

  it 'shows when each instructor record was created' do
    gretchen = Instructor.create!(name: 'Gretchen', subject: "cross-country skiing", teaches_children: true, years_experience:10)
    tristan = Instructor.create!(name: 'Tristan', subject: "snowboarding", teaches_children: false, years_experience:8)
    bob = Instructor.create!(name: 'Bob', subject: "skiing", teaches_children: false, years_experience:12)

    visit "/instructors"

    expect(page).to have_content(gretchen.created_at)
    expect(page).to have_content(tristan.created_at)
    expect(page).to have_content(bob.created_at)

    expect(bob.name).to appear_before(tristan.name)
  end



end