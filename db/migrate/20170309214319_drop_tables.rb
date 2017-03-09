class DropTables < ActiveRecord::Migration[5.0]
  def change
  	    drop_table :borrowings
  	    drop_table :payments
  end
end
