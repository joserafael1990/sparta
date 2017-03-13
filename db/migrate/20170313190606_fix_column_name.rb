class FixColumnName < ActiveRecord::Migration[5.0]
  def change
  	    rename_column :people, :distributer, :whosaler
  end
end
