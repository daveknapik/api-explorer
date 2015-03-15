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

ActiveRecord::Schema.define(version: 20150314213516) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_calls", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "examples", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "resource_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "examples", ["resource_id"], name: "index_examples_on_resource_id", using: :btree

  create_table "parameters", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "parameter_type"
    t.boolean  "required"
    t.boolean  "url_parameter"
    t.integer  "resource_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "parameters", ["resource_id"], name: "index_parameters_on_resource_id", using: :btree

  create_table "resources", force: :cascade do |t|
    t.string   "name"
    t.string   "path"
    t.string   "http_method"
    t.integer  "api_call_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "resources", ["api_call_id"], name: "index_resources_on_api_call_id", using: :btree

  add_foreign_key "examples", "resources"
  add_foreign_key "parameters", "resources"
  add_foreign_key "resources", "api_calls"
end
