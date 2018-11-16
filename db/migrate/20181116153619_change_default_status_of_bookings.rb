class ChangeDefaultStatusOfBookings < ActiveRecord::Migration[5.2]
  def change
    # change_column_null :bookings, :status, false
    change_column_default :bookings, :status, "pending"
  end
end
