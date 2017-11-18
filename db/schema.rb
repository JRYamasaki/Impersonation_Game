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

ActiveRecord::Schema.define(version: 20171118200904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lobbies", force: :cascade do |t|
    t.string "title"
    t.integer "spotsLeft"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lobbies_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "lobby_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lobby_id"], name: "index_responses_on_lobby_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer "wins"
    t.integer "correctGuess"
    t.integer "incorrectGuess"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "username"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "email"
    t.boolean "adminbit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "lobbies", "users"
  add_foreign_key "responses", "lobbies"
  add_foreign_key "responses", "users"
end
