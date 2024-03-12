class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :model_name
      t.string :brand_name
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
