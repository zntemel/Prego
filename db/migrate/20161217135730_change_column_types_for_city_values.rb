class ChangeColumnTypesForCityValues < ActiveRecord::Migration
  def change
    change_column :city_pricings, :value, :decimal
    change_column :city_ratings, :value, :decimal
    change_column :city_visit_frequencies, :value, :decimal
  end
end
