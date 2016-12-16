class CreateAvarageFlightPricings < ActiveRecord::Migration
  def change
    create_table :avarage_flight_pricings do |t|
      t.references :destination_city, index: true, foreign_key: true
      t.references :origin_city, index: true, foreign_key: true
      t.bigint :price

      t.timestamps null: false
    end
  end
end
