class ChangeColumnsAsDecimalForVenues < ActiveRecord::Migration
  def change
    change_column :venues, :pricing, :decimal
    change_column :venues, :visit_frequency, :decimal
  end
end
