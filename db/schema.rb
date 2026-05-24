# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_05_24_135014) do
  create_table "bills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "committee_meetings", force: :cascade do |t|
    t.string "committee"
    t.string "content"
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "legislator_id"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["legislator_id"], name: "index_committee_meetings_on_legislator_id"
  end

  create_table "legislators", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "plenary_meetings", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "legislator_id"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["legislator_id"], name: "index_plenary_meetings_on_legislator_id"
  end

  add_foreign_key "committee_meetings", "legislators"
  add_foreign_key "plenary_meetings", "legislators"
end
