# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170515152554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attends", force: :cascade do |t|
    t.string   "comming_from"
    t.integer  "event_id"
    t.integer  "person_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "catalogs", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_catalogs_on_category_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "details", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "sale_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_details_on_product_id", using: :btree
    t.index ["sale_id"], name: "index_details_on_sale_id", using: :btree
  end

  create_table "dispatchers", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_dispatchers_on_person_id", using: :btree
    t.index ["product_id"], name: "index_dispatchers_on_product_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.date     "event_date"
    t.string   "address"
    t.integer  "host_id"
    t.integer  "city_id"
    t.integer  "catalog_id"
    t.integer  "instructor_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["catalog_id"], name: "index_events_on_catalog_id", using: :btree
    t.index ["city_id"], name: "index_events_on_city_id", using: :btree
    t.index ["host_id"], name: "index_events_on_host_id", using: :btree
    t.index ["instructor_id"], name: "index_events_on_instructor_id", using: :btree
  end

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
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "neighborhood"
    t.integer  "zip_code"
    t.integer  "whosaler"
    t.integer  "membership"
    t.index ["city_id"], name: "index_people_on_city_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.integer  "max_discount"
    t.integer  "cost"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "weight"
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "seller_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "closed",           default: false
    t.string   "bill_request"
    t.string   "rfc"
    t.string   "business_address"
    t.string   "business_name"
    t.decimal  "total"
    t.string   "observation"
    t.index ["client_id"], name: "index_sales_on_client_id", using: :btree
    t.index ["seller_id"], name: "index_sells_on_id", using: :btree
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "active"
    t.string   "privilege"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "catalogs", "categories"
  add_foreign_key "cities", "states"
  add_foreign_key "dispatchers", "people"
  add_foreign_key "dispatchers", "products"
  add_foreign_key "events", "catalogs"
  add_foreign_key "events", "cities"
  add_foreign_key "states", "countries"
end
