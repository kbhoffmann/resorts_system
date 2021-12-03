class InstructorStudentsController < ApplicationController
  def index
    @instructor = Instructor.find(params[:instructor_id])
    @students = @instructor.students 
  end
end
