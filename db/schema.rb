# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150412153433) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "lesson_id"
    t.text     "response"
    t.date     "due_date"
    t.time     "due_time"
    t.date     "submit_date"
    t.time     "submit_time"
    t.integer  "assigned_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "assignments", ["lesson_id"], name: "index_assignments_on_lesson_id"
  add_index "assignments", ["student_id"], name: "index_assignments_on_student_id"

  create_table "audios", force: :cascade do |t|
    t.integer "forvo_id"
    t.string  "word"
    t.string  "lang_code"
    t.string  "speaker_gender"
    t.text    "forvo_data"
    t.integer "added_by_teacher_id"
    t.string  "audio_source"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_name"
    t.integer  "internal_id"
    t.string   "semester"
    t.string   "year"
    t.string   "instructor_ids"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "exercise_code"
    t.integer  "forvo_id"
    t.text     "content"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "created_by_teacher_id"
    t.string   "description"
    t.string   "answer_key"
  end

  create_table "lesson_exercises", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "exercise_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lesson_exercises", ["exercise_id"], name: "index_lesson_exercises_on_exercise_id"
  add_index "lesson_exercises", ["lesson_id"], name: "index_lesson_exercises_on_lesson_id"

  create_table "lessons", force: :cascade do |t|
    t.integer  "created_by_teacher_id"
    t.integer  "course_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "description"
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "assignment_id"
    t.integer  "exercise_id"
    t.text     "feedback"
    t.integer  "feedbacker_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "responses", ["assignment_id"], name: "index_responses_on_assignment_id"
  add_index "responses", ["exercise_id"], name: "index_responses_on_exercise_id"

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.string   "user_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_courses", ["course_id"], name: "index_user_courses_on_course_id"
  add_index "user_courses", ["user_id"], name: "index_user_courses_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.boolean  "teacher"
    t.boolean  "student"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
