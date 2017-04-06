class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :stock
      t.integer :price
      t.integer :max_discount
      t.integer :cost

      t.timestamps
    end
  end
end
