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

ActiveRecord::Schema.define(version: 20160112185855) do

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_stories", force: true do |t|
    t.integer  "category_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_stories", ["category_id"], name: "index_categories_stories_on_category_id"
  add_index "categories_stories", ["story_id"], name: "index_categories_stories_on_story_id"

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "story_id"
    t.text     "post"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["story_id"], name: "index_comments_on_story_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "stories", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "upvotes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "stories", ["user_id"], name: "index_stories_on_user_id"

end
