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

ActiveRecord::Schema.define(version: 2020_05_22_154209) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "img"
    t.string "slug"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "corporate_name"
    t.string "postal_code"
    t.string "address"
    t.string "area"
    t.text "pr"
    t.string "img"
    t.string "representative"
    t.string "tel_number"
    t.string "work_field"
    t.string "establishment"
    t.string "capital"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "npos", force: :cascade do |t|
    t.string "corporate_name"
    t.string "prefecture"
    t.string "address"
    t.string "representative"
    t.string "certification_date"
    t.string "establish_purpose"
    t.string "field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "pr"
    t.string "img"
  end

  create_table "occupations", force: :cascade do |t|
    t.string "occupation_name"
    t.string "category"
    t.string "work_contents"
    t.string "how_to_work"
    t.string "under_high_school_graduate"
    t.string "high_school_graduate"
    t.string "college_graduate"
    t.string "number_employee"
    t.string "working_time"
    t.string "payment"
    t.string "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
