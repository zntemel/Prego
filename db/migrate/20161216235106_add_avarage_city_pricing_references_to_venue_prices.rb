class AddAvarageCityPricingReferencesToVenuePrices < ActiveRecord::Migration
  def change
    add_reference :venue_prices, :avarage_city_pricing, index: true, foreign_key: true
  end
end
