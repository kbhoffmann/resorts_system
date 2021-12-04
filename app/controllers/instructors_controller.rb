class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.ordered_by_created_at
  end

  def show
    @instructor = Instructor.find(params[:id])
    @students_count = @instructor.students.count
  end

  def new
  end

  def create
    instructor = Instructor.create(instructor_params)
    redirect_to "/instructors"
  end

private
  def instructor_params
    params.permit(:name, :subject, :teaches_children, :years_experience)
  end
end
