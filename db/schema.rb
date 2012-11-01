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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121101163929) do

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.text     "content"
    t.integer  "ispublished",  :default => 0
    t.string   "releasemonth", :default => "December"
    t.string   "image"
    t.integer  "user_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "image"
    t.text     "desc"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.integer  "user_id"
    t.integer  "ispublished",  :default => 0
    t.string   "releasemonth", :default => "December"
  end

  add_index "courses", ["title", "author"], :name => "index_courses_on_title_and_author", :unique => true

  create_table "faqs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "order_id"
    t.text     "question"
    t.text     "answer"
  end

  create_table "groupings", :force => true do |t|
    t.integer  "group_id"
    t.integer  "tutorial_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "o_classes", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "no_of_days"
    t.integer  "no_of_hours_per_day"
    t.date     "start_date"
    t.date     "end_date"
    t.time     "start_time_of_day"
    t.time     "end_time_of_day"
    t.integer  "no_of_student_per_class"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "user_id"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "course_id"
    t.integer  "topic_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "blog_id"
    t.integer  "tag_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tutorials", :force => true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "image"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "user_id"
    t.integer  "ispublished",    :default => 0
    t.string   "releasemonth",   :default => "December"
    t.text     "desc"
    t.string   "difficulty"
    t.integer  "estimated_time"
  end

  add_index "tutorials", ["title", "author"], :name => "index_tutorials_on_title_and_author", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.integer  "user_type"
    t.integer  "sub_plan"
    t.text     "user_desc"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
