# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

##Parent: Resort
resort1 = Resort.create!(name: "Winter Park", runs: 20, ski_only: true, city: "Winter Park")
resort1 = Resort.create!(name: "Seven Springs", runs: 11, ski_only: false, city: "Champion")

###Child: Pass Holder
pass_holder1 = resort1.pass_holders.create!(name: "Hannah Warren", level: "beginner", age: 21, season_pass: false)
pass_holder2 = resort1.pass_holders.create!(name: "Kerri Hoffmann", level: "advanced", age: 21, season_pass: false)

##Parent: Instructor
instructor1 = Instructor.create!(name: "Hans", subject: "skiing", teaches_children: true, years_experience: 30)
instructor2 = Instructor.create!(name: "Laurie", subject: "back country", teaches_children: false, years_experience: 10)

### Child: Student
student1 = instructor1.students.create!(name: 'Gretchen', age: 20, subject: "cross-country skiing", returning_student: true, level:"advanced")
student2 = instructor1.students.create!(name: 'Tristan', age: 14, subject: "snowboarding, skiing", returning_student: false, level:"beginner")
student3 = instructor1.students.create!(name: 'Bob', age: 21, subject: "skiing", returning_student: false, level:"intermediate")