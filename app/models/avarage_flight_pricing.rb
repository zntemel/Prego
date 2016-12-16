class AvarageFlightPricing < ActiveRecord::Base
  belongs_to :origin_city, class_name: 'City'
  belongs_to :destination_city, class_name: 'City'
  has_many :flights

  validates :origin_city, :destination_city, presence: true
end
