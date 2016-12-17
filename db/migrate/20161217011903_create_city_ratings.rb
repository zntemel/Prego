class CreateCityRatings < ActiveRecord::Migration
  def change
    create_table :city_ratings do |t|
      t.integer :value
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
