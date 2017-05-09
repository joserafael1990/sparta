class AddBillToSales < ActiveRecord::Migration[5.0]
  def change
  	add_column :sales, :bill_request, :string
  end
end
