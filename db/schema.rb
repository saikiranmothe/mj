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

ActiveRecord::Schema.define(:version => 20130601105316) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "advertisements", :force => true do |t|
    t.string   "title"
    t.string   "ad_file_name"
    t.string   "ad_content_type"
    t.integer  "ad_file_size"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "advertisers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "Surname"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "h_no"
    t.string   "street"
    t.string   "area"
    t.string   "pin_no"
    t.string   "contact_no"
    t.string   "tan_no"
  end

  add_index "advertisers", ["email"], :name => "index_advertisers_on_email", :unique => true
  add_index "advertisers", ["reset_password_token"], :name => "index_advertisers_on_reset_password_token", :unique => true

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "family_members", :force => true do |t|
    t.integer  "user_id",                                  :null => false
    t.integer  "family_member_user_id",                    :null => false
    t.string   "relationship"
    t.boolean  "join_pending",          :default => true
    t.boolean  "payment_status"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "relation_id",                              :null => false
    t.boolean  "deactivate",            :default => false
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
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "priority"
  end

  create_table "user1s", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "user1s", ["email"], :name => "index_user1s_on_email", :unique => true
  add_index "user1s", ["reset_password_token"], :name => "index_user1s_on_reset_password_token", :unique => true

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "user_id",                                              :null => false
    t.string   "mobileno"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "gender"
    t.string   "mj_id"
    t.boolean  "reqstatus"
    t.boolean  "visited",                           :default => false
    t.float    "payment",                           :default => 0.0
    t.float    "due",                               :default => 0.0
    t.integer  "family_count",                      :default => 1
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "station",            :limit => 20
    t.string   "occupation",         :limit => 20
    t.string   "address",            :limit => 100
    t.string   "dob",                               :default => "",    :null => false
  end

  add_index "users", ["user_id"], :name => "index_on_user_id"

end
