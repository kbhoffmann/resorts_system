class Student < ApplicationRecord
  belongs_to :instructor

  def self.show_only_bool_true
    where(returning_student: true)
  end

  def self.by_name
    self.order(:name)
  end
end
