class StudentsController < ApplicationController
  def index
    @students = Student.show_only_bool_true
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    student = Student.find(params[:id])
    student.update(students_params)
    redirect_to "/students/#{student.id}"
  end

  def destroy
    Student.destroy(params[:id])
    redirect_to "/students"
  end

private
  def students_params
    params.permit(:name, :age, :level, :subject, :returning_student)
  end
end
