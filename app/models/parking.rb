class Parking < ApplicationRecord
  belongs_to :users, dependent: :destroy

  validates :address, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
end
