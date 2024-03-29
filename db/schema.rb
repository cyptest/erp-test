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

ActiveRecord::Schema.define(:version => 20121021224315) do

  create_table "partners", :force => true do |t|
    t.string   "company"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "postal_code"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "active"
  end

  create_table "product_partners", :id => false, :force => true do |t|
    t.integer "partner_id", :null => false
    t.integer "product_id", :null => false
  end

  add_index "product_partners", ["partner_id", "product_id"], :name => "index_product_partners_on_partner_id_and_product_id", :unique => true

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "ref"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "price"
    t.integer  "price_cents"
    t.integer  "stock"
    t.boolean  "active"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin"
  end

end
