class Parking < ApplicationRecord
  belongs_to :user

  validates :address, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch
  pg_search_scope :search_by_city,
    against: :city,
    using: {
      tsearch: { prefix: true }
    }
end
