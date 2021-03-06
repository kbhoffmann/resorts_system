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

ActiveRecord::Schema.define(version: 2021_12_02_231450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.boolean "teaches_children"
    t.integer "years_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pass_holders", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "level"
    t.boolean "season_pass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "resort_id"
    t.index ["resort_id"], name: "index_pass_holders_on_resort_id"
  end

  create_table "resorts", force: :cascade do |t|
    t.string "name"
    t.boolean "ski_only"
    t.integer "runs"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "subject"
    t.string "level"
    t.boolean "returning_student"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "instructor_id"
    t.index ["instructor_id"], name: "index_students_on_instructor_id"
  end

  add_foreign_key "pass_holders", "resorts"
  add_foreign_key "students", "instructors"
end
