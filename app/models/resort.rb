class Resort < ApplicationRecord
  has_many :pass_holders, dependent: :destroy

  def self.ordered_by_created_at
    order(:created_at)
  end
end
