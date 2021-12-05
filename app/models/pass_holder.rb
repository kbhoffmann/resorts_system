class PassHolder < ApplicationRecord
  belongs_to :resort

  def self.sort_name_alphabetically
    order(:name)
  end
end
