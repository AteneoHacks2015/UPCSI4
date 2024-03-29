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

ActiveRecord::Schema.define(version: 20150110233626) do

  create_table "accounts", force: true do |t|
    t.integer  "tag"
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", force: true do |t|
    t.string "region"
    t.string "province"
    t.string "municipality"
    t.string "street"
    t.string "block"
  end

  create_table "applicant_grants", force: true do |t|
    t.integer "app_id"
    t.integer "sch_id"
  end

  create_table "applicant_scholarship_joins", force: true do |t|
    t.integer "app_id"
    t.integer "sch_id"
  end

  create_table "applicants", force: true do |t|
    t.integer "accounts_id"
    t.string  "name"
    t.string  "gender"
    t.integer "add_id"
    t.string  "contact_num"
    t.string  "institution"
    t.integer "age"
    t.string  "level"
    t.string  "degree_program"
  end

  add_index "applicants", ["accounts_id"], name: "index_applicants_on_accounts_id", using: :btree

  create_table "scholarships", force: true do |t|
    t.string   "title"
    t.text     "desc"
    t.integer  "slot"
    t.integer  "demand",     default: 0
    t.text     "req"
    t.text     "ben"
    t.text     "app_res"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsor_scholarship_joins", force: true do |t|
    t.integer "sp_id"
    t.integer "sch_id"
  end

  create_table "sponsors", force: true do |t|
    t.integer "accounts_id"
    t.string  "institution_name"
    t.string  "add_id"
    t.string  "contact_num"
  end

  add_index "sponsors", ["accounts_id"], name: "index_sponsors_on_accounts_id", using: :btree

end
