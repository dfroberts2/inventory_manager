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

ActiveRecord::Schema.define(version: 20160304022738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string  "brand_name",   null: false
    t.integer "inventory_id", null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.integer  "owner_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string  "category_name", null: false
    t.float   "margin_value"
    t.integer "inventory_id",  null: false
  end

  create_table "category_items", force: :cascade do |t|
    t.integer  "category_scanner_id", null: false
    t.integer  "category_id",         null: false
    t.float    "quantity",            null: false
    t.float    "retail_price",        null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "category_scanners", force: :cascade do |t|
    t.integer  "inventory_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "gcp_codes", force: :cascade do |t|
    t.string "gcp",          null: false
    t.string "company_name", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.datetime "date",        null: false
    t.integer  "business_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "upc_codes", force: :cascade do |t|
    t.string "upc",          null: false
    t.string "product_name"
  end

  create_table "upc_items", force: :cascade do |t|
    t.integer  "upc_scanner_id", null: false
    t.string   "upc",            null: false
    t.float    "quantity",       null: false
    t.float    "retail_price",   null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "brand_id"
    t.string   "product_name",   null: false
  end

  create_table "upc_scanners", force: :cascade do |t|
    t.integer  "inventory_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
