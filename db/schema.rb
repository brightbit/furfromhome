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

ActiveRecord::Schema.define(version: 20130522222643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breed_names", force: true do |t|
    t.string   "name"
    t.string   "simplified_name"
    t.integer  "breed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "breed_names", ["breed_id"], name: "index_breed_names_on_breed_id", using: :btree

  create_table "breeds", force: true do |t|
    t.string   "species"
    t.string   "description"
    t.string   "url"
    t.string   "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pets", force: true do |t|
    t.string   "name"
    t.string   "color"
    t.integer  "age"
    t.integer  "weight"
    t.string   "markings"
    t.string   "gender"
    t.boolean  "collar"
    t.string   "collar_description"
    t.boolean  "chipped"
    t.boolean  "injured"
    t.string   "listing_type"
    t.datetime "missing_since_found_at"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.boolean  "returned_to_owner",      default: false
    t.string   "scraping_script"
    t.string   "scraped_feed"
    t.string   "source_url"
    t.string   "photo_url"
    t.string   "cached_species"
    t.integer  "breed_id"
    t.integer  "user_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pets", ["breed_id"], name: "index_pets_on_breed_id", using: :btree
  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "avatar_url"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
