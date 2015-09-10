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

ActiveRecord::Schema.define(version: 20150909190546) do

  create_table "draftees", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.integer  "draft_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "draftees", ["draft_id"], name: "index_draftees_on_draft_id"
  add_index "draftees", ["player_id"], name: "index_draftees_on_player_id"
  add_index "draftees", ["team_id"], name: "index_draftees_on_team_id"

  create_table "drafts", force: :cascade do |t|
    t.integer  "current_team"
    t.integer  "num_teams"
    t.integer  "user_id"
    t.integer  "pool_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "drafts", ["pool_id"], name: "index_drafts_on_pool_id"
  add_index "drafts", ["user_id"], name: "index_drafts_on_user_id"

  create_table "players", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "team"
    t.integer  "games"
    t.integer  "minutes"
    t.integer  "field_goals_percentage"
    t.string   "position"
    t.integer  "three_pointers_percentage"
    t.integer  "free_throws_percentage"
    t.integer  "rebounds"
    t.integer  "assists"
    t.integer  "steals"
    t.integer  "blocked_shots"
    t.integer  "turnovers"
    t.integer  "points"
    t.integer  "pool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "draft_id"
    t.integer  "draft_position"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "teams", ["draft_id"], name: "index_teams_on_draft_id"

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
