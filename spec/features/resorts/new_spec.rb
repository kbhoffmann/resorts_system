require 'rails_helper'

RSpec.describe 'the Resort Creation' do
  
  it 'links to the new page from the resorts index' do
    visit '/resorts'

    click_link('New Resort')
    expect(current_path).to eq('/resorts/new')
    expect(current_path).to_not eq('/pass_holders/new')
  end

  it 'can create a new resort' do
    visit '/resorts/new'

    fill_in('Name', with: "Mt.Bachelor")
    fill_in('City', with: "Bend")
    fill_in('Runs', with: 52)
    fill_in('ski_only', with: false)

    click_button('Create Resort')

    expect(current_path).to eq("/resorts")
    expect(current_path).to_not eq('/pass_holders')
    expect(page).to have_content("Mt.Bachelor")
    expect(page).to have_content("Bend")
    expect(page).to have_content(52)
    expect(page).to have_content(false)
  end
end
