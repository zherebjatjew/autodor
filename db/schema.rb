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

ActiveRecord::Schema.define(:version => 20120917040736) do

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
    t.string   "payment_notes"
    t.integer  "bill_id"
    t.date     "bill_date"
    t.integer  "order_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "author_id"
    t.integer  "seat"
    t.decimal  "prepay_amount",         :default => 0.0
    t.decimal  "inner_charge",          :default => 0.0
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
    t.string   "address"
    t.string   "contact"
    t.string   "schedule"
    t.string   "note"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "author_id"
    t.string   "phones"
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
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.date     "committed_at"
    t.integer  "forwarder_id"
    t.boolean  "signed",        :default => false, :null => false
    t.boolean  "paid",          :default => false, :null => false
    t.boolean  "completed",     :default => false, :null => false
    t.integer  "client_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "driver_id"
    t.datetime "sender_date"
    t.datetime "receiver_date"
    t.integer  "truck_id"
    t.integer  "trailer_id"
    t.integer  "author_id"
    t.integer  "shipper_id"
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
    t.integer  "author_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
