class AddCityRatingReferencesToVenues < ActiveRecord::Migration
  def change
    add_reference :venues, :city_pricing, index: true, foreign_key: true
  end
end
