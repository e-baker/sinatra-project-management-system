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

ActiveRecord::Schema.define(version: 20160414051816) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "category_type"
  end

  create_table "projects", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.string  "status"
    t.integer "owner_id"
    t.integer "category_id"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id"
  add_index "projects", ["owner_id"], name: "index_projects_on_owner_id"

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "project_id", null: false
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id"
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.datetime "due_date"
    t.integer  "project_id"
    t.integer  "category_id"
  end

  create_table "tasks_users", id: false, force: :cascade do |t|
    t.integer "task_id", null: false
    t.integer "user_id", null: false
  end

  add_index "tasks_users", ["task_id"], name: "index_tasks_users_on_task_id"
  add_index "tasks_users", ["user_id"], name: "index_tasks_users_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
  end

end
