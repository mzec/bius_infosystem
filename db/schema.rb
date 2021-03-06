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

ActiveRecord::Schema.define(:version => 20120318144959) do

  create_table "books", :force => true do |t|
    t.string   "author",      :null => false
    t.string   "title",       :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fieldwork_participations", :force => true do |t|
    t.integer  "member_id",                 :null => false
    t.integer  "fieldwork_id",              :null => false
    t.date     "joined",                    :null => false
    t.string   "role",         :limit => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fieldworks", :force => true do |t|
    t.string   "location",   :null => false
    t.text     "purpose"
    t.date     "start_date", :null => false
    t.date     "end_date",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "inventory_number", :null => false
    t.string   "name",             :null => false
    t.text     "state"
    t.integer  "procurer_id"
    t.date     "procurement_date"
    t.text     "procurement_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_fieldworks", :id => false, :force => true do |t|
    t.integer  "item_id"
    t.integer  "fieldwork_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_projects", :id => false, :force => true do |t|
    t.integer  "item_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "letters", :force => true do |t|
    t.string   "from"
    t.string   "to"
    t.date     "date"
    t.string   "subject"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "in_out",                :limit => 1
    t.string   "delivery_number"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "loans", :force => true do |t|
    t.integer  "borrower_id",   :null => false
    t.integer  "lender_id",     :null => false
    t.date     "date_from",     :null => false
    t.date     "date_to"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "loanable_id",   :null => false
    t.string   "loanable_type", :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "first_name",                            :default => "",      :null => false
    t.string   "last_name",                                                  :null => false
    t.string   "phone",                   :limit => 15, :default => "",      :null => false
    t.date     "birthdate"
    t.string   "department"
    t.string   "index_nmb",               :limit => 12
    t.string   "enrolment_year",          :limit => 4
    t.date     "join_date"
    t.date     "membership_renewal_date"
    t.string   "birthplace"
    t.string   "residence"
    t.boolean  "graduated"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "membership_card_nmb"
    t.string   "sex",                     :limit => 1
    t.date     "active_until"
    t.string   "email",                                 :default => "",      :null => false
    t.string   "encrypted_password",                    :default => "",      :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "role",                                  :default => "grunt", :null => false
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "members_tags", :id => false, :force => true do |t|
    t.integer  "member_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "membership_fees", :force => true do |t|
    t.integer "member_id"
    t.string  "year"
  end

  create_table "notifications", :force => true do |t|
    t.string   "title",                         :null => false
    t.text     "body",                          :null => false
    t.boolean  "sent",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications_tags", :id => false, :force => true do |t|
    t.integer  "notification_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_participations", :force => true do |t|
    t.integer  "member_id",               :null => false
    t.integer  "project_id",              :null => false
    t.date     "joined",                  :null => false
    t.string   "role",       :limit => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "title",                     :null => false
    t.text     "purpose"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "execution"
    t.integer  "year",         :limit => 2
    t.text     "recognitios"
    t.text     "cooperations"
  end

  create_table "reports", :force => true do |t|
    t.integer  "reportable_id"
    t.string   "reportable_type"
    t.string   "year",                  :limit => 4, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
  end

  create_table "section_memberships", :force => true do |t|
    t.integer  "member_id",               :null => false
    t.integer  "section_id",              :null => false
    t.date     "joined"
    t.string   "role",       :limit => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "mentor"
    t.text     "work_plan"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tags", :force => true do |t|
    t.string   "title",       :null => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transfers", :force => true do |t|
    t.integer  "member_id"
    t.string   "purpose",                      :null => false
    t.float    "amount",                       :null => false
    t.boolean  "is_valid"
    t.text     "validation_note"
    t.date     "date",                         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "in_out",          :limit => 1
    t.boolean  "is_secret"
  end

end
