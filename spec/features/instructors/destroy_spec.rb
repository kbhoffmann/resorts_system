require 'rails_helper'

RSpec.describe "Destroy" do

it 'deletes instructor and its students' do
    hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
    gretel = hans.students.create!(name: "Gretel", subject: "skiing", returning_student: true, age: 25, level: "intermediate")

    visit "/instructors/#{hans.id}"

    expect(page).to have_link("Delete Hans")

    click_on "Delete Hans"

    expect(current_path).to eq("/instructors")
    expect(page).to_not have_content("Hans")

    visit "/students"
    expect(page).to_not have_content("Gretel")
  end

end