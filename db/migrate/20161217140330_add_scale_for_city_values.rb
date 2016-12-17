class AddScaleForCityValues < ActiveRecord::Migration
  def change
    change_column :city_pricings, :value, :decimal, precision: 10, scale: 2
    change_column :city_ratings, :value, :decimal, precision: 10, scale: 2
    change_column :city_visit_frequencies, :value, :decimal, precision: 10, scale: 2
  end
end
