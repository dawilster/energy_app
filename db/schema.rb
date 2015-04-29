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

ActiveRecord::Schema.define(version: 20150429070503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "display_name"
    t.string   "sensor_type"
    t.string   "value"
    t.boolean  "state"
    t.string   "user_id"
    t.string   "type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "events", ["display_name"], name: "index_events_on_display_name", using: :btree
  add_index "events", ["sensor_type"], name: "index_events_on_sensor_type", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "time_in_office"
    t.integer  "temperate_value"
    t.integer  "audio_value"
    t.integer  "comfort_value"
    t.text     "comment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "lab_surveys", force: :cascade do |t|
    t.integer  "room_id"
    t.float    "hours_spent"
    t.integer  "temperature_value"
    t.integer  "noise_level"
    t.integer  "comfort_value"
    t.text     "comment"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "processed_events", force: :cascade do |t|
    t.float    "lux_value"
    t.float    "temperature_value"
    t.float    "humidity_value"
    t.boolean  "door_closed"
    t.float    "power_value"
    t.boolean  "motion_detected"
    t.boolean  "person_out"
    t.datetime "timestamp"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "surveys", force: :cascade do |t|
    t.integer  "occupants"
    t.integer  "temperature_value"
    t.integer  "noise_level"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "comment"
    t.string   "in_out"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
