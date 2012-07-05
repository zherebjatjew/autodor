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

ActiveRecord::Schema.define(:version => 20120705165240) do

  create_table "clients", :force => true do |t|
    t.boolean  "organization",  :default => false, :null => false
    t.string   "name",                             :null => false
    t.date     "born_at"
    t.string   "identity"
    t.string   "address"
    t.string   "contact"
    t.string   "working_hours"
    t.string   "note"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "info"
    t.integer  "user_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.date     "committed_at"
    t.decimal  "forwarder_id"
    t.boolean  "signed",       :default => false, :null => false
    t.boolean  "paid",         :default => false, :null => false
    t.boolean  "completed",    :default => false, :null => false
    t.decimal  "client_id"
    t.decimal  "sender_id"
    t.decimal  "receiver_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "role",               :default => "operator"
    t.string   "schedule"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
