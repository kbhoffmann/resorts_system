class AddResortToPassHolders < ActiveRecord::Migration[5.2]
  def change
    add_reference :pass_holders, :resort, foreign_key: true
  end
end
