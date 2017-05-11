class AddToSells < ActiveRecord::Migration[5.0]
  def change
  	add_column :sales, :rfc, :string
  	add_column :sales, :address_name, :string
  	add_column :sales, :business_name, :string
  end
end
