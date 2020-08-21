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

ActiveRecord::Schema.define(version: 2020_08_15_220145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "admin_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_projects_on_admin_id"
    t.index ["team_id"], name: "index_projects_on_team_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.bigint "project_id", null: false
    t.bigint "team_member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["team_member_id"], name: "index_tasks_on_team_member_id"
  end

  create_table "team_members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "admin_id", null: false
    t.bigint "team_member_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_teams_on_admin_id"
    t.index ["team_member_id"], name: "index_teams_on_team_member_id"
  end

  add_foreign_key "projects", "admins"
  add_foreign_key "projects", "teams"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "team_members"
  add_foreign_key "teams", "admins"
  add_foreign_key "teams", "team_members"
end
