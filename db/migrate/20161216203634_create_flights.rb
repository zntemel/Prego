class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.date :flight_date
      t.datetime :quote_datetime
      t.bigint :price

      t.timestamps null: false
    end

    add_reference :flights, :destination_city, references: :cities, index: true
    add_foreign_key :flights, :cities, column: :destination_city_id

    add_reference :flights, :origin_city, references: :cities, index: true
    add_foreign_key :flights, :cities, column: :origin_city_id
  end
end
