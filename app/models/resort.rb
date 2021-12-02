class Resort < ApplicationRecord
  has_many :pass_holders

  def ordered
    @resorts = Resort.order(:created_at)
  end
end
