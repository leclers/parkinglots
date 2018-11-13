class AddCityToParkings < ActiveRecord::Migration[5.2]
  def change
    add_column :parkings, :city, :string
    add_column :parkings, :zip_code, :integer
  end
end
