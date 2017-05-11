class ChangeColumnsProducts < ActiveRecord::Migration[5.0]
  def change
  	change_column :products, :weight, :integer
  end
end
