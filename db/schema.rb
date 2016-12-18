# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161217193002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avarage_flight_pricings", force: :cascade do |t|
    t.integer  "price",               limit: 8
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "destination_city_id"
    t.integer  "origin_city_id"
  end

  add_index "avarage_flight_pricings", ["destination_city_id"], name: "index_avarage_flight_pricings_on_destination_city_id", using: :btree
  add_index "avarage_flight_pricings", ["origin_city_id"], name: "index_avarage_flight_pricings_on_origin_city_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "initials"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pricing"
  end

  create_table "city_pricings", force: :cascade do |t|
    t.decimal  "value",      precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "city_id"
  end

  add_index "city_pricings", ["city_id"], name: "index_city_pricings_on_city_id", using: :btree

  create_table "city_ratings", force: :cascade do |t|
    t.decimal  "value",      precision: 10, scale: 2
    t.integer  "city_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "city_ratings", ["city_id"], name: "index_city_ratings_on_city_id", using: :btree

  create_table "city_visit_frequencies", force: :cascade do |t|
    t.decimal  "value",      precision: 10, scale: 2
    t.integer  "city_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "city_visit_frequencies", ["city_id"], name: "index_city_visit_frequencies_on_city_id", using: :btree

  create_table "flights", force: :cascade do |t|
    t.date     "flight_date"
    t.datetime "quote_datetime"
    t.integer  "min_price",                 limit: 8
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "destination_city_id"
    t.integer  "origin_city_id"
    t.integer  "avarage_flight_pricing_id"
  end

  add_index "flights", ["avarage_flight_pricing_id"], name: "index_flights_on_avarage_flight_pricing_id", using: :btree
  add_index "flights", ["destination_city_id"], name: "index_flights_on_destination_city_id", using: :btree
  add_index "flights", ["origin_city_id"], name: "index_flights_on_origin_city_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "city_pricing_id"
    t.integer  "city_rating_id"
    t.integer  "city_visit_frequency_id"
    t.decimal  "pricing"
    t.decimal  "rating"
    t.decimal  "visit_frequency"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "venues", ["city_id"], name: "index_venues_on_city_id", using: :btree
  add_index "venues", ["city_pricing_id"], name: "index_venues_on_city_pricing_id", using: :btree
  add_index "venues", ["city_rating_id"], name: "index_venues_on_city_rating_id", using: :btree
  add_index "venues", ["city_visit_frequency_id"], name: "index_venues_on_city_visit_frequency_id", using: :btree

  add_foreign_key "avarage_flight_pricings", "cities", column: "destination_city_id"
  add_foreign_key "avarage_flight_pricings", "cities", column: "origin_city_id"
  add_foreign_key "city_pricings", "cities"
  add_foreign_key "city_ratings", "cities"
  add_foreign_key "city_visit_frequencies", "cities"
  add_foreign_key "flights", "avarage_flight_pricings"
  add_foreign_key "flights", "cities", column: "destination_city_id"
  add_foreign_key "flights", "cities", column: "origin_city_id"
  add_foreign_key "venues", "cities"
  add_foreign_key "venues", "city_pricings"
  add_foreign_key "venues", "city_ratings"
  add_foreign_key "venues", "city_visit_frequencies"
end
