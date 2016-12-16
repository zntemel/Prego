class AvarageFlightPricing < ActiveRecord::Base
  belongs_to :destination_city
  belongs_to :origin_city
end
