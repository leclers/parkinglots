class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :parkings

  validates :start_time, presence: true
  validates :finish_time, presence: true
end
