class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :parking

  validates :start_time, presence: true
  validates :finish_time, presence: true

  def end_time
    finish_time
  end
end
