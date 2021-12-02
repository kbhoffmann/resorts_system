require 'rails_helper'

RSpec.describe 'the pass holders show page' do

  it 'displays the pass holder attributes' do
    resort = Resort.create!(name: "Winter Park", runs: 20, ski_only: true, city: "Winter Park")
    pass_holder1 = resort.pass_holders.create!(name: "Hannah Warren", level: "beginner", age: 21, season_pass: false)
    pass_holder2 = resort.pass_holders.create!(name: "Kerri Hoffmann", level: "advanced", age: 21, season_pass: false)

    visit "/resorts/#{resort.id}/pass_holders_table"
    expect(page).to have_content(resort.pass_holders)

  end

end