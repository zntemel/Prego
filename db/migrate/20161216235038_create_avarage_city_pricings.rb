class CreateAvarageCityPricings < ActiveRecord::Migration
  def change
    create_table :avarage_city_pricings do |t|
      t.integer :value

      t.timestamps null: false
    end
  end
end
