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

ActiveRecord::Schema.define(version: 20150822235722) do

  create_table "applications", force: :cascade do |t|
    t.integer  "pin_id"
    t.integer  "user_id"
    t.boolean  "reached"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "information"
  end

  add_index "applications", ["pin_id"], name: "index_applications_on_pin_id"
  add_index "applications", ["user_id"], name: "index_applications_on_user_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "initials"
    t.string   "branch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pins", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "publication"
    t.datetime "realization"
    t.integer  "duration"
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.integer  "help_type"
    t.string   "faculty"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pins", ["course_id"], name: "index_pins_on_course_id"
  add_index "pins", ["user_id"], name: "index_pins_on_user_id"

  create_table "universities", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "profession"
    t.string   "role"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "university_id"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "provider"
    t.string   "uid"
    t.string   "authentication_token"
    t.text     "biography"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"
  add_index "users", ["university_id"], name: "index_users_on_university_id"

end
