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

ActiveRecord::Schema.define(version: 20130811011459) do

  create_table "externals", force: true do |t|
    t.integer  "sketch_id"
    t.integer  "tester_id"
    t.integer  "subject_id"
    t.integer  "number"
    t.boolean  "finalized",      default: false
    t.integer  "attribute1size", default: 5
    t.integer  "attribute2size", default: 5
    t.integer  "attribute3size", default: 5
    t.integer  "attribute4size", default: 5
    t.integer  "attribute5size", default: 5
    t.integer  "attribute6size", default: 5
    t.integer  "attribute7size", default: 5
    t.integer  "attribute8size", default: 5
    t.integer  "attribute9size", default: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "internals", force: true do |t|
    t.integer  "sketch_id"
    t.integer  "tester_id"
    t.integer  "subject_id"
    t.integer  "number"
    t.boolean  "finalized",      default: false
    t.integer  "attribute1size", default: 5
    t.integer  "attribute2size", default: 5
    t.integer  "attribute3size", default: 5
    t.integer  "attribute4size", default: 5
    t.integer  "attribute5size", default: 5
    t.integer  "attribute6size", default: 5
    t.integer  "attribute7size", default: 5
    t.integer  "attribute8size", default: 5
    t.integer  "attribute9size", default: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sketches", force: true do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.integer  "status"
    t.string   "attribute1"
    t.string   "attribute2"
    t.string   "attribute3"
    t.string   "attribute4"
    t.string   "attribute5"
    t.string   "attribute6"
    t.string   "attribute7"
    t.string   "attribute8"
    t.string   "attribute9"
    t.integer  "T1A1"
    t.integer  "T1A2"
    t.integer  "T1A3"
    t.integer  "T1A4"
    t.integer  "T1A5"
    t.integer  "T1A6"
    t.integer  "T1A7"
    t.integer  "T1A8"
    t.integer  "T1A9"
    t.integer  "T2A1"
    t.integer  "T2A2"
    t.integer  "T2A3"
    t.integer  "T2A4"
    t.integer  "T2A5"
    t.integer  "T2A6"
    t.integer  "T2A7"
    t.integer  "T2A8"
    t.integer  "T2A9"
    t.integer  "T3A1"
    t.integer  "T3A2"
    t.integer  "T3A3"
    t.integer  "T3A4"
    t.integer  "T3A5"
    t.integer  "T3A6"
    t.integer  "T3A7"
    t.integer  "T3A8"
    t.integer  "T3A9"
    t.integer  "T4A1"
    t.integer  "T4A2"
    t.integer  "T4A3"
    t.integer  "T4A4"
    t.integer  "T4A5"
    t.integer  "T4A6"
    t.integer  "T4A7"
    t.integer  "T4A8"
    t.integer  "T4A9"
    t.integer  "T5A1"
    t.integer  "T5A2"
    t.integer  "T5A3"
    t.integer  "T5A4"
    t.integer  "T5A5"
    t.integer  "T5A6"
    t.integer  "T5A7"
    t.integer  "T5A8"
    t.integer  "T5A9"
    t.integer  "T6A1"
    t.integer  "T6A2"
    t.integer  "T6A3"
    t.integer  "T6A4"
    t.integer  "T6A5"
    t.integer  "T6A6"
    t.integer  "T6A7"
    t.integer  "T6A8"
    t.integer  "T6A9"
    t.integer  "T7A1"
    t.integer  "T7A2"
    t.integer  "T7A3"
    t.integer  "T7A4"
    t.integer  "T7A5"
    t.integer  "T7A6"
    t.integer  "T7A7"
    t.integer  "T7A8"
    t.integer  "T7A9"
    t.integer  "T8A1"
    t.integer  "T8A2"
    t.integer  "T8A3"
    t.integer  "T8A4"
    t.integer  "T8A5"
    t.integer  "T8A6"
    t.integer  "T8A7"
    t.integer  "T8A8"
    t.integer  "T8A9"
    t.integer  "T9A1"
    t.integer  "T9A2"
    t.integer  "T9A3"
    t.integer  "T9A4"
    t.integer  "T9A5"
    t.integer  "T9A6"
    t.integer  "T9A7"
    t.integer  "T9A8"
    t.integer  "T9A9"
    t.integer  "T10A1"
    t.integer  "T10A2"
    t.integer  "T10A3"
    t.integer  "T10A4"
    t.integer  "T10A5"
    t.integer  "T10A6"
    t.integer  "T10A7"
    t.integer  "T10A8"
    t.integer  "T10A9"
    t.integer  "T11A1"
    t.integer  "T11A2"
    t.integer  "T11A3"
    t.integer  "T11A4"
    t.integer  "T11A5"
    t.integer  "T11A6"
    t.integer  "T11A7"
    t.integer  "T11A8"
    t.integer  "T11A9"
    t.integer  "T12A1"
    t.integer  "T12A2"
    t.integer  "T12A3"
    t.integer  "T12A4"
    t.integer  "T12A5"
    t.integer  "T12A6"
    t.integer  "T12A7"
    t.integer  "T12A8"
    t.integer  "T12A9"
    t.integer  "T13A1"
    t.integer  "T13A2"
    t.integer  "T13A3"
    t.integer  "T13A4"
    t.integer  "T13A5"
    t.integer  "T13A6"
    t.integer  "T13A7"
    t.integer  "T13A8"
    t.integer  "T13A9"
    t.integer  "T14A1"
    t.integer  "T14A2"
    t.integer  "T14A3"
    t.integer  "T14A4"
    t.integer  "T14A5"
    t.integer  "T14A6"
    t.integer  "T14A7"
    t.integer  "T14A8"
    t.integer  "T14A9"
    t.integer  "T15A1"
    t.integer  "T15A2"
    t.integer  "T15A3"
    t.integer  "T15A4"
    t.integer  "T15A5"
    t.integer  "T15A6"
    t.integer  "T15A7"
    t.integer  "T15A8"
    t.integer  "T15A9"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "code"
  end

  add_index "subjects", ["email"], name: "index_subjects_on_email", unique: true
  add_index "subjects", ["reset_password_token"], name: "index_subjects_on_reset_password_token", unique: true

  create_table "testers", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "code"
    t.string   "relationship"
  end

  add_index "testers", ["email"], name: "index_testers_on_email", unique: true
  add_index "testers", ["reset_password_token"], name: "index_testers_on_reset_password_token", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
