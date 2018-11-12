class Parking < ApplicationRecord
  belongs_to :user

  validates :address, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
end
