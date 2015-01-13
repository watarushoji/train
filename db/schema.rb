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

ActiveRecord::Schema.define(version: 20150113105915) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content",     limit: 255
    t.string   "category"
    t.text     "sumnail",     limit: 255
    t.text     "domain",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category2"
    t.string   "category3"
    t.string   "category4"
    t.text     "image",       limit: 255
    t.integer  "pv",                      default: 0
    t.boolean  "from_crawl",              default: false
    t.text     "crawl_image"
    t.string   "site"
    t.integer  "category_id"
  end

  add_index "articles", ["category_id"], name: "index_articles_on_category_id"

  create_table "avsamples", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.text     "affi_title"
    t.text     "affi_link"
    t.string   "actress_name"
    t.text     "sumnail"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "site"
    t.integer  "pv",           default: 0
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score",      limit: 255, default: 0
  end

  create_table "categoriesarticles", force: true do |t|
    t.string   "article_id"
    t.string   "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categoriesarticles", ["article_id"], name: "index_categoriesarticles_on_article_id"
  add_index "categoriesarticles", ["category_id"], name: "index_categoriesarticles_on_category_id"

  create_table "categorizations", force: true do |t|
    t.integer  "article_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["article_id"], name: "index_categorizations_on_article_id"
  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id"

  create_table "crawlsites", force: true do |t|
    t.text     "thumb"
    t.string   "title"
    t.text     "uri"
    t.text     "embed"
    t.string   "time"
    t.string   "sitename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", force: true do |t|
    t.string   "name"
    t.string   "mail"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
