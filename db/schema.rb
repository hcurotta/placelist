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

ActiveRecord::Schema.define(:version => 20121205021639) do

  create_table "followings", :force => true do |t|
    t.integer  "leader_id"
    t.integer  "follower_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "good_ats", :force => true do |t|
    t.string   "timestring"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "good_fors", :force => true do |t|
    t.string   "what"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "good_ons", :force => true do |t|
    t.string   "daystring"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "good_whens", :force => true do |t|
    t.string   "weather_is"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "list_attributes", :force => true do |t|
    t.integer  "list_id"
    t.text     "attr"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "list_items", :force => true do |t|
    t.integer  "list_id"
    t.integer  "venue_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
  end

  create_table "lists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "list_item_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "good_for_id"
    t.integer  "good_on_id"
    t.integer  "good_at_id"
    t.integer  "good_when_id"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "list_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "foursquareid"
    t.string   "address"
    t.string   "city"
  end

end
