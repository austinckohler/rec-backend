# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_24_010452) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "areaid"
    t.integer "area_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_activities_on_area_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "areaID"
    t.string "name"
    t.text "description"
    t.text "directions"
    t.string "phone"
    t.text "email"
    t.float "long"
    t.float "lat"
    t.string "lastUpdated"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "title"
    t.string "URL"
    t.string "areaid"
    t.integer "area_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["area_id"], name: "index_links_on_area_id"
  end

  add_foreign_key "activities", "areas"
  add_foreign_key "links", "areas"
end
