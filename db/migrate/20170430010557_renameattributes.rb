class Renameattributes < ActiveRecord::Migration[5.0]
  def change
  	rename_column :details, :sell_id, :sale_id
  end
end
