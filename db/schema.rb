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

ActiveRecord::Schema.define(version: 20151013010033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["trip_id"], name: "index_activities_on_trip_id", using: :btree

  create_table "activity_items", force: :cascade do |t|
    t.string   "item_name"
    t.string   "activity_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "trip_id"
  end

  create_table "activity_items_trips", id: false, force: :cascade do |t|
    t.integer "trip_id",          null: false
    t.integer "activity_item_id", null: false
  end

  create_table "custom_items", force: :cascade do |t|
    t.string "item"
  end

  create_table "custom_trips", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "custom_item_id"
  end

  create_table "default_items", force: :cascade do |t|
    t.string "item"
    t.string "category"
  end

  create_table "default_items_trips", id: false, force: :cascade do |t|
    t.integer "trip_id",         null: false
    t.integer "default_item_id", null: false
  end

  create_table "default_trips", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "default_item_id"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "trip_activity_items", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "activity_item_id"
    t.boolean  "checked",          default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "trip_default_items", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "default_item_id"
    t.boolean  "checked",         default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer "user_id"
    t.string  "destination"
    t.string  "start_date"
    t.string  "end_date"
    t.integer "activity_item_id"
    t.string  "current_location"
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "identities", "users"
end
