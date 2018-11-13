class AddPhotoToParkinglots < ActiveRecord::Migration[5.2]
  def change
    add_column :parkings, :photo, :string
  end
end
