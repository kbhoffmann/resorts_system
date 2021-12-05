class InstructorStudentsController < ApplicationController
  def index
    @instructor = Instructor.find(params[:instructor_id])
    if params[:sort]
      @students = @instructor.students.by_name
    else
      @students = @instructor.students.all
    end
  end

  def new
    @instructor = Instructor.find(params[:instructor_id])
  end

  def create
    @instructor = Instructor.find(params[:instructor_id])
    student = @instructor.students.create(instructor_students_params)
    redirect_to "/instructors/#{@instructor.id}/students"
  end


private
  def instructor_students_params
    params.permit(:name, :level, :age, :returning_student, :subject)
  end
end
