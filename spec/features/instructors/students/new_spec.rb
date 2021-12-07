require 'rails_helper'

# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe "Create new students for an instructor" do

  before(:each) do
    @instructor = Instructor.create!(name: "Olga", years_experience: 5, subject:"skiing", teaches_children:false)
  end

  it 'links to the new student page from the parent show page' do
    visit "/instructors/#{@instructor.id}/students"

    click_link('New Student')
    expect(current_path).to eq("/instructors/#{@instructor.id}/students/new")
  end

  it 'can create new student for an instructor' do
    visit "/instructors/#{@instructor.id}/students/new"

    fill_in(:name, with: "Helen")
    fill_in(:age, with: 65)
    check :returning_student
    fill_in(:level, with: "intermediate")
    fill_in(:subject, with: "snowboarding")
    click_button("Create Student for Instructor #{@instructor.name}")

    expect(current_path).to eq("/instructors/#{@instructor.id}/students")
    expect(page).to have_content("Helen")
  end


end