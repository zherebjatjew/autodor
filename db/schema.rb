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

ActiveRecord::Schema.define(:version => 20121123114206) do

  create_table "car_owners", :force => true do |t|
    t.integer  "car_id"
    t.integer  "driver_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "author_id"
  end

  create_table "cargos", :force => true do |t|
    t.string   "name"
    t.float    "weight_kg"
    t.float    "volume_m"
    t.string   "packing"
    t.decimal  "cost"
    t.string   "temperature"
    t.string   "train_type"
    t.string   "load"
    t.boolean  "seal"
    t.boolean  "pneumo"
    t.boolean  "lift"
    t.string   "requirements"
    t.decimal  "transportation_charge"
    t.string   "tcharge_notes"
    t.integer  "bill_id"
    t.date     "bill_date"
    t.integer  "order_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "author_id"
    t.integer  "seat"
    t.decimal  "prepay_amount",         :default => 0.0
    t.decimal  "inner_charge",          :default => 0.0
    t.string   "icharge_notes",         :default => ""
    t.string   "prepay_notes",          :default => ""
    t.integer  "receiver_id"
    t.integer  "sender_id"
    t.datetime "sender_date"
    t.datetime "receiver_date"
  end

  create_table "cars", :force => true do |t|
    t.string   "model"
    t.string   "identity"
    t.string   "base"
    t.float    "volume_m"
    t.float    "payload_kg"
    t.boolean  "is_trailer"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "author_id"
  end

  create_table "clients", :force => true do |t|
    t.boolean  "organization", :default => false, :null => false
    t.string   "name",                            :null => false
    t.date     "born_at"
    t.string   "identity"
    t.string   "address1"
    t.string   "contact"
    t.string   "schedule"
    t.string   "note"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "author_id"
    t.string   "phones"
    t.date     "signed_at"
    t.string   "address2",     :default => ""
    t.string   "inn"
    t.string   "kpp"
    t.string   "account"
    t.string   "ati"
    t.string   "corr_account"
    t.string   "bic"
    t.string   "faxes"
    t.string   "email"
    t.string   "director",     :default => ""
    t.integer  "num",          :default => 0,     :null => false
  end

  add_index "clients", ["num"], :name => "idx_clients_num"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2",       :default => ""
    t.string   "faxes"
    t.string   "inn"
    t.string   "kpp"
    t.string   "account"
    t.string   "corr_account"
    t.string   "ati"
    t.string   "bic"
    t.date     "born_at"
    t.string   "identity"
    t.string   "schedule"
    t.string   "phones"
    t.string   "email"
    t.string   "director"
    t.string   "director_short"
    t.boolean  "organization",   :default => true
    t.string   "contact"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "drivers", :force => true do |t|
    t.string   "name",       :null => false
    t.date     "born_at"
    t.string   "identity"
    t.string   "address"
    t.string   "note"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "phone"
    t.integer  "author_id"
    t.integer  "shipper_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "info"
    t.integer  "user_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.date     "committed_at"
    t.integer  "forwarder_id"
    t.integer  "client_id"
    t.integer  "driver_id"
    t.integer  "truck_id"
    t.integer  "trailer_id"
    t.integer  "author_id"
    t.integer  "shipper_id"
    t.integer  "status_id",    :default => 1
  end

  create_table "shippers", :force => true do |t|
    t.integer  "author_id"
    t.string   "name"
    t.string   "director"
    t.string   "director_short"
    t.string   "registration"
    t.string   "address1"
    t.string   "address2"
    t.string   "inn"
    t.string   "kpp"
    t.string   "ogrn"
    t.string   "ati"
    t.string   "corr_account"
    t.string   "bic"
    t.string   "phones"
    t.string   "email"
    t.string   "contact"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "account"
    t.integer  "num"
  end

  add_index "shippers", ["num"], :name => "idx_shippers_num"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "role",               :default => "operator"
    t.string   "schedule"
    t.integer  "author_id"
    t.boolean  "banned",             :default => false,      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "workflow_names", :force => true do |t|
    t.string   "name"
    t.integer  "weight"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "workflows", :force => true do |t|
    t.integer  "from_id"
    t.integer  "to_id"
    t.boolean  "admin_only", :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "workflows", ["from_id"], :name => "index_workflows_on_from_id"
  add_index "workflows", ["to_id"], :name => "index_workflows_on_to_id"

end
