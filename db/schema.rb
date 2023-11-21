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

ActiveRecord::Schema.define(version: 2023_11_20_092033) do

  create_table "assignments", force: :cascade do |t|
    t.integer "month"
    t.decimal "rnd_percentage"
    t.decimal "total"
    t.string "owner_type", null: false
    t.integer "owner_id", null: false
    t.integer "project_id"
    t.index ["owner_id", "owner_type", "project_id"], name: "index_assignments_on_owner_id_and_owner_type_and_project_id"
    t.index ["owner_type", "owner_id"], name: "index_assignments_on_owner"
    t.index ["project_id"], name: "index_assignments_on_project_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.string "name"
    t.decimal "total"
    t.decimal "salary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.decimal "salary"
    t.decimal "total"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
  end

end
