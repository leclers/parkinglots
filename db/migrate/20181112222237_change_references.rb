class ChangeReferences < ActiveRecord::Migration[5.2]
  def change
    remove_reference :parkings, :users
    add_reference :parkings, :user, foreign_key: true

    remove_reference :bookings, :users
    remove_reference :bookings, :parkings
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :parking, foreign_key: true
  end
end
