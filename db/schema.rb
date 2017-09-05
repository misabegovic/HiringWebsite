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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170905162102) do

  create_table "Customers_Offers", id: false, force: :cascade do |t|
    t.integer "Customer_id", null: false
    t.integer "Offer_id", null: false
    t.index ["Customer_id", "Offer_id"], name: "index_Customers_Offers_on_customer_id_and_offer_id"
    t.index ["Offer_id", "Customer_id"], name: "index_Customers_Offers_on_offer_id_and_customer_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "position"
    t.integer "salary"
    t.string "type_of_contract"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_offers_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.text "properties"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
