# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101109204109) do

  create_table "associateds", :force => true do |t|
    t.integer  "property_id"
    t.integer  "contact_id"
    t.string   "ctype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.string   "level"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "job_title"
    t.string   "company_address"
    t.string   "home_address"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "cell_phone"
    t.string   "fax"
    t.string   "email"
    t.string   "preferred_method"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
  end

  create_table "contacts_properties", :id => false, :force => true do |t|
    t.integer "contact_id"
    t.integer "property_id"
  end

  add_index "contacts_properties", ["contact_id", "property_id"], :name => "index_contacts_properties_on_contact_id_and_property_id", :unique => true
  add_index "contacts_properties", ["property_id"], :name => "index_contacts_properties_on_property_id"

  create_table "notes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "contact_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.string   "mls"
    t.integer  "reo"
    t.integer  "esc"
    t.string   "occupancy"
    t.string   "prop_type"
    t.string   "prop_style"
    t.integer  "street_num"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "floor"
    t.string   "unit"
    t.string   "building"
    t.string   "primary_seller"
    t.string   "status"
    t.integer  "list_price"
    t.integer  "commission"
    t.datetime "listing_date"
    t.string   "listing_term"
    t.datetime "closing_date"
    t.integer  "year_built"
    t.string   "prop_id"
    t.datetime "last_sold"
    t.string   "area"
    t.string   "zoning"
    t.string   "feat_lot_size"
    t.string   "feat_sq_ft"
    t.integer  "feat_floors"
    t.integer  "feat_num_bedrooms"
    t.integer  "feat_num_bathrooms"
    t.string   "feat_flooring"
    t.string   "feat_heating"
    t.string   "feat_a_c"
    t.string   "feat_fireplace"
    t.string   "feat_basement"
    t.string   "feat_parking"
    t.string   "feat_view"
    t.string   "mat_construction"
    t.string   "mat_exterior"
    t.string   "mat_roof"
    t.string   "mat_sewer"
    t.string   "mat_water"
    t.string   "mat_septic"
    t.integer  "fin_taxes"
    t.integer  "fin_tax_year"
    t.integer  "fin_tax_assessment"
    t.integer  "fin_land_assessment"
    t.string   "fin_tax_roll_num"
    t.integer  "fin_building_improvement"
    t.string   "fin_financial"
    t.string   "price_range"
    t.integer  "sale_price"
    t.text     "description"
    t.string   "hoa_name"
    t.string   "hoa_contact_person"
    t.string   "hoa_phone"
    t.string   "hoa_address"
    t.integer  "hoa_monthly_fee"
    t.datetime "hoa_last_payment"
    t.integer  "hoa_payments_due"
    t.string   "hoa_services_included"
    t.string   "hoa_supplements"
    t.string   "hoa_code_violations"
    t.string   "hoa_sign_complications"
    t.string   "hoa_gate_code"
    t.string   "lockbox"
    t.integer  "purchase_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "property_documents", :force => true do |t|
    t.integer  "property_id"
    t.integer  "user_id"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "property_photos", :force => true do |t|
    t.integer  "property_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
