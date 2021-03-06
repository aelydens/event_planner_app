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

ActiveRecord::Schema.define(version: 20150302045626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.string  "name"
    t.integer "capacity"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.integer  "capacity"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["company_id"], name: "index_events_on_company_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.string  "name"
    t.date    "date"
    t.integer "course_id"
  end

  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "events", "companies"
  add_foreign_key "lessons", "courses"
end
