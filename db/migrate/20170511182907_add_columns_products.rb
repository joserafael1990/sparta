class AddColumnsProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :weight, :decimal
  end
end
