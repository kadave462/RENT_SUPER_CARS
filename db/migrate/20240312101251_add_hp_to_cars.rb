class AddHpToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :horse_power, :integer
  end
end
