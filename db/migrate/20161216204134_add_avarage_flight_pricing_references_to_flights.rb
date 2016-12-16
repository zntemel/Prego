class AddAvarageFlightPricingReferencesToFlights < ActiveRecord::Migration
  def change
    add_reference :flights, :avarage_flight_pricing, index: true, foreign_key: true
  end
end
