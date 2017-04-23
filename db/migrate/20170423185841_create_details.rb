class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details do |t|
      t.integer :quantity
      t.references :sell
      t.references :product

      t.timestamps
    end
  end
end
