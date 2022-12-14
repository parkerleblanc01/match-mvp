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

ActiveRecord::Schema[7.0].define(version: 2022_11_09_012625) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "donors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "generated_donations", force: :cascade do |t|
    t.float "amount"
    t.bigint "match_donation_id", null: false
    t.bigint "single_donation_id", null: false
    t.bigint "donor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donor_id"], name: "index_generated_donations_on_donor_id"
    t.index ["match_donation_id"], name: "index_generated_donations_on_match_donation_id"
    t.index ["single_donation_id"], name: "index_generated_donations_on_single_donation_id"
  end

  create_table "match_donations", force: :cascade do |t|
    t.bigint "donor_id", null: false
    t.float "max_amount"
    t.boolean "active", default: true
    t.float "per_donor_amount"
    t.float "per_dollar_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donor_id"], name: "index_match_donations_on_donor_id"
  end

  create_table "single_donations", force: :cascade do |t|
    t.bigint "donor_id", null: false
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donor_id"], name: "index_single_donations_on_donor_id"
  end

  add_foreign_key "generated_donations", "donors"
  add_foreign_key "generated_donations", "match_donations"
  add_foreign_key "generated_donations", "single_donations"
  add_foreign_key "match_donations", "donors"
  add_foreign_key "single_donations", "donors"
end
