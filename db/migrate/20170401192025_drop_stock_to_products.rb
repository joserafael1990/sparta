class DropStockToProducts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :stock
  end
end
