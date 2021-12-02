class Resort < ApplicationRecord
  has_many :pass_holders

  def self.ordered_by_created_at
    order(:created_at)
  end
end
