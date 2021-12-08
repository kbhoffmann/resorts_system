class Student < ApplicationRecord
  belongs_to :instructor

  def self.show_only_bool_true
    where(returning_student: true)
  end

  def self.by_name
    order(:name)
  end

  def self.min_age(provided)
    where("age >= #{provided}")
  end
  
end
