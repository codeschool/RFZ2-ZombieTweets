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

ActiveRecord::Schema.define(:version => 20111004163823) do

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  create_table "categorizations", :force => true do |t|
    t.integer "tweet_id"
    t.integer "category_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.integer  "tweeter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.string   "message"
    t.integer  "zombie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "private"
    t.string   "location",      :limit => 30
    t.boolean  "show_location",               :default => false
  end

  create_table "weapons", :force => true do |t|
    t.string   "name"
    t.integer  "ammo"
    t.boolean  "is_broken"
    t.date     "purchased_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weapons_zombies", :id => false, :force => true do |t|
    t.integer "weapon_id"
    t.integer "zombie_id"
  end

  create_table "zombies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
