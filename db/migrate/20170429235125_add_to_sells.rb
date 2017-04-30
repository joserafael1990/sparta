class AddToSells < ActiveRecord::Migration[5.0]
  def change
  	add_column :sells, :closed, :boolean 
  end
end
