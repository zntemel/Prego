class CreateVenuePrices < ActiveRecord::Migration
  def change
    create_table :venue_prices do |t|
      t.integer :value
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
