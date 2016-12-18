class CreateAvarageFlightPricings < ActiveRecord::Migration
  def change
    create_table :avarage_flight_pricings do |t|
      t.bigint :price

      t.timestamps null: false
    end

    add_reference :avarage_flight_pricings, :destination_city, references: :cities, index: true
    add_foreign_key :avarage_flight_pricings, :cities, column: :destination_city_id

    add_reference :avarage_flight_pricings, :origin_city, references: :cities, index: true
    add_foreign_key :avarage_flight_pricings, :cities, column: :origin_city_id
  end
end
