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

ActiveRecord::Schema[7.0].define(version: 2022_06_29_183823) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptance_relations", force: :cascade do |t|
    t.bigint "perspective_id"
    t.bigint "proposition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["perspective_id"], name: "index_acceptance_relations_on_perspective_id"
    t.index ["proposition_id"], name: "index_acceptance_relations_on_proposition_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id"
    t.string "reference_type"
    t.bigint "reference_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["reference_type", "reference_id"], name: "index_answers_on_reference"
  end

  create_table "arguments", force: :cascade do |t|
    t.string "subject_type", null: false
    t.bigint "subject_id", null: false
    t.string "title"
    t.text "body"
    t.integer "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_type", "subject_id"], name: "index_arguments_on_subject"
  end

  create_table "candidate_relations", force: :cascade do |t|
    t.bigint "dependency_id"
    t.bigint "proposition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dependency_id"], name: "index_candidate_relations_on_dependency_id"
    t.index ["proposition_id"], name: "index_candidate_relations_on_proposition_id"
  end

  create_table "dependencies", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.bigint "proposition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposition_id"], name: "index_dependencies_on_proposition_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "username", null: false
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["username"], name: "index_members_on_username", unique: true
  end

  create_table "perspectives", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "propositions", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
