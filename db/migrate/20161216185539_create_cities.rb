class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :initials
      t.string :name

      t.timestamps null: false
    end
  end
end
