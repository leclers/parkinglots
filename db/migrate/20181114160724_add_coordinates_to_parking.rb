class AddCoordinatesToParking < ActiveRecord::Migration[5.2]
  def change
    add_column :parkings, :latitude, :float
    add_column :parkings, :longitude, :float
  end
end
