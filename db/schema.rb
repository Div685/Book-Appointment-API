# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_15_105231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string "date", null: false
    t.string "branch"
    t.bigint "item_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_appointments_on_item_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code"
    t.string "name", null: false
    t.integer "percentage"
    t.string "start_at", null: false
    t.string "end_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_coupons", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "coupon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coupon_id"], name: "index_item_coupons_on_coupon_id"
    t.index ["item_id"], name: "index_item_coupons_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_coupons", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "coupon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coupon_id"], name: "index_user_coupons_on_coupon_id"
    t.index ["user_id"], name: "index_user_coupons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointments", "items"
  add_foreign_key "appointments", "users"
  add_foreign_key "item_coupons", "coupons"
  add_foreign_key "item_coupons", "items"
  add_foreign_key "user_coupons", "coupons"
  add_foreign_key "user_coupons", "users"
end
