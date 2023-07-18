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

ActiveRecord::Schema.define(version: 2023_07_18_163448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_figures", force: :cascade do |t|
    t.string "figure"
    t.string "brand"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_action_figures_on_user_id"
  end

  create_table "comics", force: :cascade do |t|
    t.string "name"
    t.json "image"
    t.float "issue_number"
    t.string "publisher"
    t.bigint "user_id", null: false
    t.string "aliases"
    t.string "api_detail_url"
    t.date "cover_date"
    t.datetime "date_added"
    t.datetime "date_last_updated"
    t.string "deck"
    t.text "description"
    t.boolean "has_staff_review"
    t.text "associated_images"
    t.string "volume"
    t.string "comic_vine_id"
    t.index ["comic_vine_id"], name: "index_comics_on_comic_vine_id"
    t.index ["user_id"], name: "index_comics_on_user_id"
  end

  create_table "comics_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "comic_id", null: false
    t.index ["comic_id", "user_id"], name: "index_comics_users_on_comic_id_and_user_id"
    t.index ["user_id", "comic_id"], name: "index_comics_users_on_user_id_and_comic_id"
  end

  create_table "mangas", force: :cascade do |t|
    t.string "title"
    t.float "issue"
    t.string "publisher"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_mangas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "action_figures", "users"
  add_foreign_key "comics", "users"
  add_foreign_key "mangas", "users"
end
