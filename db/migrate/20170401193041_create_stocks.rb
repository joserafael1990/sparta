class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :quantity
      t.references :product, foreign_key: true
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
