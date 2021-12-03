class Instructor < ApplicationRecord
  has_many :students

  def self.ordered_by_created_at
    order(created_at: :desc)
  end
end
