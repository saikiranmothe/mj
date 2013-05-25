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

ActiveRecord::Schema.define(:version => 20130423092907) do

  create_table "advertisements", :force => true do |t|
    t.string   "title"
    t.string   "ad_file_name"
    t.string   "ad_content_type"
    t.integer  "ad_file_size"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "family_members", :force => true do |t|
    t.integer  "user_id",               :default => 0,    :null => false
    t.integer  "family_member_user_id", :default => 0,    :null => false
    t.boolean  "join_pending",          :default => true
    t.float    "payment_status",        :default => 0.0
    t.integer  "relation_id",           :default => 0,    :null => false
    t.integer  "integer",               :default => 0,    :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "family_members", ["family_member_user_id"], :name => "index_on_fmuid"
  add_index "family_members", ["user_id"], :name => "user_id_index"

  create_table "feedbacks", :force => true do |t|
    t.text     "details"
    t.integer  "user_id",    :default => 0, :null => false
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "relations", :force => true do |t|
    t.string   "relationship"
    t.integer  "priority",     :default => 0, :null => false
    t.integer  "integer",      :default => 0, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstname",          :default => "",    :null => false
    t.string   "lastname",           :default => "",    :null => false
    t.integer  "user_id",            :default => 0,     :null => false
    t.string   "mobileno",           :default => "",    :null => false
    t.string   "email",              :default => "",    :null => false
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "occupation",         :default => "",    :null => false
    t.string   "station",            :default => "",    :null => false
    t.text     "address"
    t.string   "gender"
    t.string   "mj_id",              :default => "",    :null => false
    t.boolean  "reqstatus"
    t.boolean  "visited",            :default => false
    t.float    "payment",            :default => 0.0
    t.float    "due",                :default => 0.0
    t.integer  "family_count",       :default => 1
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "dob",                :default => "",    :null => false
  end

  add_index "users", ["user_id"], :name => "index_on_user_id"

end
