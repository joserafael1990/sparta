class AddTotalandOBs < ActiveRecord::Migration[5.0]
  def change
  	add_column :sales, :total, :decimal
  	add_column :sales, :observation, :string
  end
end
