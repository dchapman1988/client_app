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

ActiveRecord::Schema.define(:version => 20111215172619) do

  create_table "attachments", :force => true do |t|
    t.integer  "client_application_id"
    t.string   "description"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_applications", :force => true do |t|
    t.string   "business_name"
    t.string   "taxpayer_id_number"
    t.string   "business_address"
    t.string   "business_website"
    t.string   "billing_address"
    t.string   "parent_company"
    t.string   "dba_name"
    t.string   "city"
    t.string   "state_of_residence"
    t.string   "state"
    t.string   "contact_method"
    t.string   "phone_number"
    t.integer  "years_in_business"
    t.integer  "number_of_employees"
    t.string   "zip"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "articles_of_incorporation_file_name"
    t.string   "proof_of_insurance_file_name"
    t.string   "business_license_file_name"
    t.string   "partnership_agreement_file_name"
    t.string   "limited_partnership_file_name"
    t.string   "charter_file_name"
    t.string   "association_resolution_file_name"
    t.string   "irs_tax_exempt_status_form_file_name"
    t.string   "bank_statement_file_name"
    t.string   "tax_return_one_file_name"
    t.string   "tax_return_two_file_name"
    t.string   "business_type"
    t.string   "market_symbol"
    t.string   "other_type"
  end

end
