class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.references :city, index: true, foreign_key: true
      t.references :city_pricing, index: true, foreign_key: true
      t.references :city_rating, index: true, foreign_key: true
      t.references :city_visit_frequency, index: true, foreign_key: true
      t.integer :pricing
      t.decimal :rating
      t.integer :visit_frequency

      t.timestamps null: false
    end
  end
end
