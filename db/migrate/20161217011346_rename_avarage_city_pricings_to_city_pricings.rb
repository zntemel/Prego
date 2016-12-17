class RenameAvarageCityPricingsToCityPricings < ActiveRecord::Migration
  def change
    rename_table :avarage_city_pricings, :city_pricings
  end
end
