class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.boolean :status
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :starting_date
      t.datetime :ending_date

      t.timestamps
    end
  end

end
