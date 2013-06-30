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

ActiveRecord::Schema.define(:version => 20130630204312) do

  create_table "charges", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "amount"
    t.boolean  "paid",               :default => false
    t.boolean  "refunded",           :default => false
    t.string   "stripe_customer_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "stripe_charge_id"
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "ancestry"
  end

  add_index "comments", ["ancestry"], :name => "index_comments_on_ancestry"
  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id", "created_at"], :name => "index_comments_on_user_id_and_created_at"

  create_table "events", :force => true do |t|
    t.string   "title",                             :null => false
    t.string   "tagline"
    t.text     "description"
    t.datetime "when"
    t.decimal  "price"
    t.integer  "host_id"
    t.boolean  "paid",           :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "url"
    t.string   "image_filename"
  end

  add_index "events", ["host_id"], :name => "index_events_on_host_id"

  create_table "guestlists", :force => true do |t|
    t.integer  "event_id"
    t.integer  "viewer_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "guestlists", ["event_id", "viewer_id"], :name => "index_guestlists_on_event_id_and_viewer_id", :unique => true
  add_index "guestlists", ["event_id"], :name => "index_guestlists_on_event_id"
  add_index "guestlists", ["viewer_id"], :name => "index_guestlists_on_viewer_id"

  create_table "speakers", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "biography"
    t.string   "remember_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
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
  end

  add_index "speakers", ["email"], :name => "index_speakers_on_email", :unique => true
  add_index "speakers", ["reset_password_token"], :name => "index_speakers_on_reset_password_token", :unique => true

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "remember_token"
    t.boolean  "admin",                  :default => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
