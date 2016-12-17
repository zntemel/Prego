class AddPricingToCities < ActiveRecord::Migration
  def change
    add_column :cities, :pricing, :integer 
  end
end
