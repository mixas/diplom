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

ActiveRecord::Schema.define(:version => 20111111143357) do

  create_table "all_tests", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "description"
  end

  create_table "answers", :force => true do |t|
    t.string   "title"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "right"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "learning_plans", :force => true do |t|
    t.integer  "adaptive_test_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.float    "complexity"
    t.integer  "adaptive_test_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "results", :force => true do |t|
    t.integer  "learning_plan_id"
    t.time     "passing_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "login"
    t.string   "name"
    t.string   "surname_to_users"
    t.string   "surname"
    t.integer  "group_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
