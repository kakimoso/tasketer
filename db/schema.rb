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

ActiveRecord::Schema.define(version: 2018_09_22_082207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "segment_titles", force: :cascade do |t|
    t.string "name", null: false
    t.integer "type", null: false
    t.bigint "work_spaces_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_spaces_id"], name: "index_segment_titles_on_work_spaces_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "row_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "matrix_status"
    t.string "type"
    t.boolean "archived", default: false
    t.bigint "work_space_id"
    t.index ["type"], name: "index_tasks_on_type"
    t.index ["work_space_id"], name: "index_tasks_on_work_space_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_spaces", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_work_spaces_on_user_id"
  end

  add_foreign_key "segment_titles", "work_spaces", column: "work_spaces_id"
  add_foreign_key "tasks", "work_spaces"
  add_foreign_key "work_spaces", "users"
end
