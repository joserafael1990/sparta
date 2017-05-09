class CreateSells < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
    t.integer  "client_id"
    t.integer  "seller_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["client_id"], name: "index_sells_on_client_id", using: :btree
    t.index ["seller_id"], name: "index_sells_on_id", using: :btree
    end
  end
end
