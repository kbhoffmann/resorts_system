class PassHolder < ApplicationRecord
  belongs_to :resort

  def self.sort_name_alphabetically
    order(:name)
  end

  def self.true_only
    where(season_pass: true)
  end
end
