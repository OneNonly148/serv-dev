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

ActiveRecord::Schema.define(version: 20170713081609) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "car"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_partners", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "ic"
    t.string "address"
    t.string "edu_inst"
    t.string "edu_study"
    t.string "oc_position"
    t.string "oc_sal"
    t.string "oc_trans"
    t.string "oc_cover"
    t.string "oc_exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "sp_deploys", force: :cascade do |t|
    t.integer "spid_id"
    t.string "spname"
    t.string "serv_loc"
    t.string "date_book"
    t.string "time_book"
    t.integer "csid_id"
    t.string "csname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["csid_id"], name: "index_sp_deploys_on_csid_id"
    t.index ["spid_id"], name: "index_sp_deploys_on_spid_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.boolean "admin"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admins", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
