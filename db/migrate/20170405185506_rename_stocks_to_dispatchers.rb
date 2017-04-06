class RenameStocksToDispatchers < ActiveRecord::Migration[5.0]
  def change
  	    rename_table :stocks, :dispatchers
  end
end
