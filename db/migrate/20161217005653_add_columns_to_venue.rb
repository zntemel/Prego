class AddColumnsToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :rating, :decimal, precision: 2, scale: 1
    add_column :venues, :visit_frequency, :integer
    rename_column :venues, :value, :price
  end
end
