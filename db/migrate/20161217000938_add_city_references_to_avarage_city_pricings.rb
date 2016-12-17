class AddCityReferencesToAvarageCityPricings < ActiveRecord::Migration
  def change
    add_reference :avarage_city_pricings, :city, index: true, foreign_key: true
  end
end
