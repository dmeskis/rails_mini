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

ActiveRecord::Schema.define(version: 20180902203045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forms", force: :cascade do |t|
    t.bigint "student_id"
    t.string "mood"
    t.string "worked_hard_at"
    t.string "done_better_at"
    t.string "favorite_part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_forms_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "image", default: "/default_student.png"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "student_id", null: false
    t.index ["student_id", "user_id"], name: "index_students_users_on_student_id_and_user_id"
    t.index ["user_id", "student_id"], name: "index_students_users_on_user_id_and_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role", default: 0
    t.string "email"
    t.string "phone"
    t.string "first_name"
    t.string "last_name"
    t.string "image", default: "/default_user.png"
  end

  add_foreign_key "forms", "students"
end
