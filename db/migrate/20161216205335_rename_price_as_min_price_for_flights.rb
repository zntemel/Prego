class RenamePriceAsMinPriceForFlights < ActiveRecord::Migration
  def change
    rename_column :flights, :price, :min_price
  end
end
