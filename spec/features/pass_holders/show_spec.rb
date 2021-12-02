require 'rails_helper'

RSpec.describe 'the pass holders show page' do

  it 'displays the pass holder attributes' do
    resort = Resort.create!(name: "Winter Park", runs: 20, ski_only: true, city: "Winter Park")
    pass_holder1 = resort.pass_holders.create!(name: "Hannah Warren", level: "beginner", age: 21, season_pass: false)
    pass_holder2 = resort.pass_holders.create!(name: "Kerri Hoffmann", level: "advanced", age: 21, season_pass: false)
    visit "/pass_holders/#{pass_holder1.id}"

    expect(page).to have_content(pass_holder1.id)
    expect(page).to have_content(pass_holder1.name)
    expect(page).to have_content(pass_holder1.level)
    expect(page).to have_content(pass_holder1.age)
    expect(page).to have_content(pass_holder1.season_pass)
    expect(page).to have_content(pass_holder1.created_at)
    expect(page).to have_content(pass_holder1.updated_at)

    expect(page).to_not have_content(pass_holder2.name)
  end

end