class AddDistributer < ActiveRecord::Migration[5.0]
  def change
  	add_column :people, :distributer, :integer 
  end
end
