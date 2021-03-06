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

ActiveRecord::Schema.define(version: 20160427125653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ratings", primary_key: "rating_id", force: :cascade do |t|
    t.integer "rating",  null: false
    t.integer "user_id"
    t.integer "wine_id"
  end

  create_table "styles", primary_key: "style_id", force: :cascade do |t|
    t.text   "description",            default: "No description yet"
    t.string "name",        limit: 32,                                null: false
  end

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string  "username",      limit: 25,                 null: false
    t.string  "password",      limit: 64,                 null: false
    t.string  "password_salt", limit: 64,                 null: false
    t.boolean "admin",                    default: false
  end

  add_index "users", ["username"], name: "users_username_key", unique: true, using: :btree

  create_table "wines", primary_key: "wine_id", force: :cascade do |t|
    t.string  "name",     limit: 120, null: false
    t.string  "country",  limit: 60,  null: false
    t.integer "year"
    t.integer "style_id"
  end

  add_index "wines", ["name"], name: "wines_name_key", unique: true, using: :btree

  add_foreign_key "ratings", "users", primary_key: "user_id", name: "ratings_user_id_fkey"
  add_foreign_key "ratings", "wines", primary_key: "wine_id", name: "ratings_wine_id_fkey"
  add_foreign_key "wines", "styles", primary_key: "style_id", name: "wines_style_id_fkey"
end
