class FixCarsColumnsName < ActiveRecord::Migration[7.1]
  def change
    rename_column :cars, :brand_name, :car_brand
    rename_column :cars, :model_name, :car_model
  end
end
