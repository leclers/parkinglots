class AddPhotoToParkinglots < ActiveRecord::Migration[5.2]
  def change
    add_column :parkinglots, :photo, :string
  end
end
