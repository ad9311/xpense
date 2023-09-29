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

ActiveRecord::Schema[7.0].define(version: 2023_09_29_001206) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cycles", force: :cascade do |t|
    t.integer "month", null: false
    t.integer "year", null: false
    t.bigint "user_id", null: false
    t.float "balance", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cycles_on_user_id"
  end

  create_table "expense_limits", force: :cascade do |t|
    t.float "amount", default: 0.0, null: false
    t.bigint "cycle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cycle_id"], name: "index_expense_limits_on_cycle_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.text "description", null: false
    t.float "amount", null: false
    t.bigint "cycle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cycle_id"], name: "index_expenses_on_cycle_id"
  end

  create_table "fixed_transactions", force: :cascade do |t|
    t.text "description", null: false
    t.float "amount", null: false
    t.integer "category", default: 0, null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fixed_transactions_on_user_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.text "description", null: false
    t.float "amount", null: false
    t.bigint "cycle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cycle_id"], name: "index_incomes_on_cycle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.float "balance", default: 0.0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cycles", "users"
  add_foreign_key "expense_limits", "cycles"
  add_foreign_key "expenses", "cycles"
  add_foreign_key "fixed_transactions", "users"
  add_foreign_key "incomes", "cycles"
end
