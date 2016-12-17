class CreateCityVisitFrequencies < ActiveRecord::Migration
  def change
    create_table :city_visit_frequencies do |t|
      t.integer :value
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
