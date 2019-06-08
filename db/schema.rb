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

ActiveRecord::Schema.define(version: 2019_06_04_041905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.string "telephone"
    t.string "nit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_answers", force: :cascade do |t|
    t.bigint "car_inspection_id"
    t.bigint "question_id"
    t.integer "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_inspection_id"], name: "index_car_answers_on_car_inspection_id"
    t.index ["question_id"], name: "index_car_answers_on_question_id"
  end

  create_table "car_inspections", force: :cascade do |t|
    t.bigint "car_id", null: false
    t.integer "car_expert_id"
    t.string "owner", null: false
    t.decimal "kilometraje", null: false
    t.string "color", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_expert_id"], name: "index_car_inspections_on_car_expert_id"
    t.index ["car_id"], name: "index_car_inspections_on_car_id"
  end

  create_table "car_processes", force: :cascade do |t|
    t.integer "dispatcher_id"
    t.bigint "car_id", null: false
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_car_processes_on_car_id"
    t.index ["dispatcher_id"], name: "index_car_processes_on_dispatcher_id"
  end

  create_table "car_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "reference_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "car_brand", null: false
    t.string "model", null: false
    t.integer "year", null: false
    t.string "plate", null: false
    t.string "vin", null: false
    t.bigint "car_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_type_id"], name: "index_cars_on_car_type_id"
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "document_type_id", null: false
    t.bigint "car_process_id", null: false
    t.string "image"
    t.string "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_process_id"], name: "index_documents_on_car_process_id"
    t.index ["document_type_id"], name: "index_documents_on_document_type_id"
  end

  create_table "inspection_comments", force: :cascade do |t|
    t.bigint "car_inspection_id", null: false
    t.bigint "question_category_id"
    t.string "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_inspection_id"], name: "index_inspection_comments_on_car_inspection_id"
    t.index ["question_category_id"], name: "index_inspection_comments_on_question_category_id"
  end

  create_table "inspection_photos", force: :cascade do |t|
    t.bigint "car_inspection_id", null: false
    t.bigint "question_category_id"
    t.string "image", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_inspection_id"], name: "index_inspection_photos_on_car_inspection_id"
    t.index ["question_category_id"], name: "index_inspection_photos_on_question_category_id"
  end

  create_table "question_categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "question_category_id", null: false
    t.string "text_query", null: false
    t.string "question_type", null: false
    t.string "options", default: [], array: true
    t.integer "points", null: false
    t.integer "order", null: false
    t.string "key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_questions_on_key"
    t.index ["question_category_id", "order"], name: "index_questions_on_question_category_id_and_order", unique: true
    t.index ["question_category_id"], name: "index_questions_on_question_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "type", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_users_on_brand_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "car_answers", "car_inspections"
  add_foreign_key "car_answers", "questions"
  add_foreign_key "car_inspections", "cars"
  add_foreign_key "car_processes", "cars"
  add_foreign_key "cars", "car_types"
  add_foreign_key "documents", "car_processes"
  add_foreign_key "documents", "document_types"
  add_foreign_key "inspection_comments", "car_inspections"
  add_foreign_key "inspection_comments", "question_categories"
  add_foreign_key "inspection_photos", "car_inspections"
  add_foreign_key "inspection_photos", "question_categories"
  add_foreign_key "questions", "question_categories"
  add_foreign_key "users", "brands"
end
