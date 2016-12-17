class AddCityRatingAndVisitFrequencyToVenues < ActiveRecord::Migration
  def change
    add_reference :venues, :city_rating, index: true, foreign_key: true
    add_reference :venues, :visit_frequency, index: true, foreign_key: true
  end
end
