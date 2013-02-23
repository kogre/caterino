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

ActiveRecord::Schema.define(:version => 20130222221639) do

  create_table "customers", :force => true do |t|
    t.integer  "table_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "active"
  end

  add_index "customers", ["table_id"], :name => "index_customers_on_table_id"

  create_table "order_note_components", :force => true do |t|
    t.integer  "amount"
    t.integer  "order_note_id"
    t.integer  "product_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "order_note_components", ["order_note_id"], :name => "index_order_note_components_on_order_note_id"
  add_index "order_note_components", ["product_id"], :name => "index_order_note_components_on_product_id"

  create_table "order_note_states", :force => true do |t|
    t.string   "state"
    t.integer  "order_note_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "order_note_states", ["order_note_id"], :name => "index_order_note_states_on_order_note_id"

  create_table "order_notes", :force => true do |t|
    t.integer  "customer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "order_notes", ["customer_id"], :name => "index_order_notes_on_customer_id"

  create_table "payments", :force => true do |t|
    t.integer  "customer_id"
    t.decimal  "amount",      :precision => 6, :scale => 2
    t.string   "type"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "status"
  end

  add_index "payments", ["customer_id"], :name => "index_payments_on_customer_id"

  create_table "product_groups", :force => true do |t|
    t.integer  "ordering"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "pid"
    t.string   "name"
    t.decimal  "price"
    t.boolean  "active"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "product_group_id"
    t.string   "hotkey"
  end

  add_index "products", ["product_group_id"], :name => "index_products_on_product_group_id"

  create_table "tables", :force => true do |t|
    t.integer  "x"
    t.integer  "y"
    t.integer  "h"
    t.integer  "w"
    t.integer  "capacity"
    t.integer  "tid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
