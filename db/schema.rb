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

ActiveRecord::Schema.define(version: 20180709115356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "skus", force: :cascade do |t|
    t.string "sku"
    t.string "name"
    t.string "add_field1"
    t.string "add_field2"
    t.string "add_field3"
    t.string "add_field4"
    t.string "add_field5"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "supplier_id"
    t.index ["sku"], name: "index_skus_on_sku", unique: true
    t.index ["supplier_id"], name: "index_skus_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "skus", "suppliers"
end
