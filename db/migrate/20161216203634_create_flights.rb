class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.references :origin_city, index: true, foreign_key: true
      t.references :destination_city, index: true, foreign_key: true
      t.date :flight_date
      t.datetime :quote_datetime
      t.bigint :price

      t.timestamps null: false
    end
  end
end
