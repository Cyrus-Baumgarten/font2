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
    t.string   "attribute1"
    t.string   "attribute2"
    t.string   "attribute3"
    t.string   "attribute4"
    t.string   "attribute5"
    t.string   "attribute6"
    t.string   "attribute7"
    t.string   "attribute8"
    t.string   "attribute9"
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

  add_index "subjects", ["email"], name: "index_subjects_on_email"
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

  add_index "testers", ["email"], name: "index_testers_on_email"
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
