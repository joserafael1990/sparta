class AddColumnsToSales1 < ActiveRecord::Migration[5.0]
  def change
  	rename_column :sales, :address_name, :business_address
  end
end
