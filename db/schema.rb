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

ActiveRecord::Schema.define(version: 20180211224843) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "idea_images", force: :cascade do |t|
    t.bigint "image_id"
    t.bigint "idea_id"
    t.index ["idea_id"], name: "index_idea_images_on_idea_id"
    t.index ["image_id"], name: "index_idea_images_on_image_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "title"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "full_name"
    t.string "username"
    t.string "password_digest"
  end

  add_foreign_key "idea_images", "ideas"
  add_foreign_key "idea_images", "images"
  add_foreign_key "ideas", "users"
end