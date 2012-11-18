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

ActiveRecord::Schema.define(:version => 20121116010205) do

  create_table "billers", :force => true do |t|
    t.string   "biller_name"
    t.decimal  "rate",        :precision => 10, :scale => 2
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "cust_contacts", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.boolean  "primary"
    t.integer  "customer_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "invoice_headers", :force => true do |t|
    t.integer  "customer_id"
    t.decimal  "invoice_total", :precision => 10, :scale => 0
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "invoice_lines", :force => true do |t|
    t.integer  "invoice_header_id"
    t.integer  "biller_id"
    t.integer  "matter_id"
    t.decimal  "rate",              :precision => 10, :scale => 2
    t.decimal  "quantity",          :precision => 10, :scale => 2
    t.decimal  "line_total",        :precision => 10, :scale => 2
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.string   "description"
  end

  create_table "invoice_lines_matters", :id => false, :force => true do |t|
    t.integer  "matter_id"
    t.integer  "invoice_line_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "invoice_lines_matters", ["invoice_line_id"], :name => "index_matter_inv_lines_on_invoice_line_id"
  add_index "invoice_lines_matters", ["matter_id"], :name => "index_matter_inv_lines_on_matter_id"

  create_table "invoices", :force => true do |t|
    t.string   "item"
    t.integer  "quantity"
    t.decimal  "price",       :precision => 10, :scale => 0
    t.integer  "customer_id"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "matter_inv_lines", :id => false, :force => true do |t|
    t.integer  "matter_id"
    t.integer  "invoice_line_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "matter_inv_lines", ["invoice_line_id"], :name => "index_matter_inv_lines_on_invoice_line_id"
  add_index "matter_inv_lines", ["matter_id"], :name => "index_matter_inv_lines_on_matter_id"

  create_table "matters", :force => true do |t|
    t.string   "matter"
    t.integer  "customer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
