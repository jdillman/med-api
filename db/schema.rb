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

ActiveRecord::Schema.define(version: 2019_05_17_041742) do

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "active_at"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "caregivers", force: :cascade do |t|
    t.string "license_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personable_type", "personable_id"], name: "index_caregivers_on_personable_type_and_personable_id"
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "admitted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personable_type", "personable_id"], name: "index_patients_on_personable_type_and_personable_id"
  end

  create_table "people", force: :cascade do |t|
    t.integer "account_id"
    t.integer "person_type_id"
    t.string "email"
    t.string "name"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "personable_id"
    t.string "personable_type"
    t.index ["account_id"], name: "index_people_on_account_id"
    t.index ["name"], name: "index_people_on_name"
    t.index ["person_type_id"], name: "index_people_on_person_type_id"
  end

  create_table "person_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_person_types_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visit_items", force: :cascade do |t|
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_visit_items_on_account_id"
  end

  create_table "visits", force: :cascade do |t|
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_visits_on_account_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.integer "account_id"
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.integer "caregiver_id"
    t.index ["account_id"], name: "index_shifts_on_account_id"
    t.index ["caregiver_id"], name: "index_shifts_on_caregiver_id"
  end

end
