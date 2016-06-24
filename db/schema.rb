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

ActiveRecord::Schema.define(version: 20160623150839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "recipient"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.boolean  "ship_address"
    t.boolean  "bill_address"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "bids", force: :cascade do |t|
    t.float    "bid_amount"
    t.boolean  "highest_bid"
    t.boolean  "winning_bid"
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bids", ["item_id"], name: "index_bids_on_item_id", using: :btree
  add_index "bids", ["user_id"], name: "index_bids_on_user_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "description"
    t.float    "price"
    t.boolean  "dead"
    t.boolean  "dress"
    t.boolean  "pant"
    t.boolean  "shirt"
    t.boolean  "jacket"
    t.boolean  "sweater"
    t.boolean  "top"
    t.boolean  "male"
    t.boolean  "female"
    t.boolean  "unisex"
    t.boolean  "xxs"
    t.boolean  "xs"
    t.boolean  "s"
    t.boolean  "m"
    t.boolean  "l"
    t.boolean  "xl"
    t.boolean  "xxl"
    t.boolean  "surprise"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deadline"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["item_id"], name: "index_likes_on_item_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "payment_id"
    t.integer  "ship_address_id"
    t.integer  "bill_address_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "orders", ["bill_address_id"], name: "index_orders_on_bill_address_id", using: :btree
  add_index "orders", ["item_id"], name: "index_orders_on_item_id", using: :btree
  add_index "orders", ["payment_id"], name: "index_orders_on_payment_id", using: :btree
  add_index "orders", ["ship_address_id"], name: "index_orders_on_ship_address_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "cardholder"
    t.string   "cardnumber"
    t.string   "cvv"
    t.string   "provider"
    t.string   "month"
    t.string   "year"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payments", ["user_id"], name: "index_payments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "password"
    t.boolean  "dress"
    t.boolean  "pant"
    t.boolean  "shirt"
    t.boolean  "jacket"
    t.boolean  "sweater"
    t.boolean  "top"
    t.boolean  "male"
    t.boolean  "female"
    t.boolean  "unisex"
    t.boolean  "xxs"
    t.boolean  "xs"
    t.boolean  "s"
    t.boolean  "m"
    t.boolean  "l"
    t.boolean  "xl"
    t.boolean  "xxl"
    t.boolean  "surprise"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "views", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "views", ["item_id"], name: "index_views_on_item_id", using: :btree
  add_index "views", ["user_id"], name: "index_views_on_user_id", using: :btree

end
