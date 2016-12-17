class RenameVenuePricesToVenues < ActiveRecord::Migration
  def change
    rename_table :venue_prices, :venues
  end
end
