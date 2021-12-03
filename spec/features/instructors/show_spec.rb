require 'rails_helper'

RSpec.describe 'the instructors show page' do

  it 'displays the instructor attributes' do

    instructor = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)

    visit "/instructors/#{instructor.id}"

    expect(page).to have_content(instructor.name)
    expect(page).to have_content(instructor.id)
    expect(page).to have_content(instructor.subject)
    expect(page).to have_content(instructor.teaches_children)
    expect(page).to have_content(instructor.years_experience)
    expect(page).to have_content(instructor.created_at)
    expect(page).to have_content(instructor.updated_at)
  end

end