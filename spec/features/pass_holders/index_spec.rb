require 'rails_helper'

RSpec.describe "Pass holders index" do

  it 'shows all pass holders' do
    resort = Resort.create!(name: "Winter Park", runs: 20, ski_only: true, city: "Winter Park")
    pass_holder1 = resort.pass_holders.create!(name: "Hannah Warren", level: "beginner", age: 21, season_pass: false)
    pass_holder2 = resort.pass_holders.create!(name: "Kerri Hoffmann", level: "advanced", age: 21, season_pass: false)

    visit '/pass_holders'

    expect(page).to have_content(pass_holder1.name)
    expect(page).to have_content(pass_holder1.level)
    expect(page).to have_content(pass_holder1.age)
    expect(page).to have_content(pass_holder1.created_at)
    expect(page).to have_content(pass_holder1.updated_at)

    expect(page).to have_content(pass_holder2.name)
    expect(page).to have_content(pass_holder2.level)
    expect(page).to have_content(pass_holder2.age)
    expect(page).to have_content(pass_holder2.created_at)
    expect(page).to have_content(pass_holder2.updated_at)
  end



end