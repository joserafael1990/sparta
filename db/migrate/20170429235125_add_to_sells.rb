class AddToSells < ActiveRecord::Migration[5.0]
  def change
  	add_column :sales, :closed, :boolean 
  end
end
