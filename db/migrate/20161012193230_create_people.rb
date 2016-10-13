class CreatePeople < ActiveRecord::Migration[5.0]
  def change
  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "sex"
    t.string   "email"
    t.string   "phone"
    t.string   "job_title"
    t.text     "address"
    t.string   "delegation"
    t.integer  "employee"
    t.integer  "patient"
    t.integer  "student"
    t.integer  "instructor"
    t.integer  "client"
    t.integer  "host"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_people_on_city_id", using: :btree
  end
  end
end
