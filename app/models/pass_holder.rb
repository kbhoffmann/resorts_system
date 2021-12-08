class PassHolder < ApplicationRecord
  belongs_to :resort

  def self.sort_name_alphabetically
    order(:name)
  end

  def self.true_only
    where(season_pass: true)
  end

  def self.minimum_age(min_age)
    where("age > #{min_age}")
  end
end
