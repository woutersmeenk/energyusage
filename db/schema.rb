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

ActiveRecord::Schema.define(version: 2021_09_22_053502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "energy_meters", force: :cascade do |t|
    t.string "name"
    t.date "start"
    t.date "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "energy_usages", force: :cascade do |t|
    t.date "period_start"
    t.decimal "amount"
    t.bigint "energy_meter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["energy_meter_id"], name: "index_energy_usages_on_energy_meter_id"
  end

  add_foreign_key "energy_usages", "energy_meters"
end
