class City < ActiveRecord::Base
  has_many :avarage_flight_pricings, foreign_key: 'destination_city_id'
  has_many :city_ratings
  has_many :city_visit_frequencies

  validates :name, :initials, presence: true
end
