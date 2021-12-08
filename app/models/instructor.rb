class Instructor < ApplicationRecord
  has_many :students, :dependent => :destroy

  def self.ordered_by_created_at
    order(created_at: :desc)
  end

  def self.ordered_by_student_count
    left_joins(:students).group(:id).order(Arel.sql("COUNT(students.id) DESC"))
  end
  
end
