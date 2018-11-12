class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.string :address
      t.text :description
      t.datetime :start_time
      t.datetime :finish_time
      t.float :price
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
