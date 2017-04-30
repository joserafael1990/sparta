class SetDefult < ActiveRecord::Migration[5.0]
  def change
  	change_column :sales, :closed, :boolean, :default => false
  end
end
