require 'rails_helper'

RSpec.describe 'Destroy student' do
    
    it 'can delete the student record but not the parent' do
        hans = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
        gretchen = hans.students.create!(name: 'Gretchen', age: 20, subject: "cross-country skiing", returning_student: true, level:"advanced")

        visit "/students/#{gretchen.id}"

        click_link "Delete Gretchen"

        expect(current_path).to eq('/students')
        expect(page).to_not have_content("Gretchen")

        visit "/instructors/#{hans.id}"
        expect(page).to_not have_content("Gretchen")
    end
end