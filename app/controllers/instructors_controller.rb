class InstructorsController < ApplicationController
  def index
    @instructors = Instructor.ordered_by_created_at
  end

  def show
    @instructor = Instructor.find(params[:id])
  end
end
