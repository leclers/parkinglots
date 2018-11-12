class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :status
      t.datetime :start_time
      t.datetime :finish_time
      t.references :users, foreign_key: true
      t.references :parkings, foreign_key: true

      t.timestamps
    end
  end
end
