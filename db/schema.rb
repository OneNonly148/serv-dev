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

ActiveRecord::Schema.define(version: 20170728011025) do

  create_table "bookings", force: :cascade do |t|
    t.string "name"
    t.string "phone_no"
    t.string "email"
    t.string "prefered_booking_date"
    t.integer "location_id"
    t.string "package"
    t.integer "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_bookings_on_location_id"
    t.index ["model_id"], name: "index_bookings_on_model_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.integer "status"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managements", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.integer "status"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mjlocs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mnlocs", force: :cascade do |t|
    t.string "name"
    t.integer "mjloc_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mjloc_id"], name: "index_mnlocs_on_mjloc_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.integer "make_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["make_id"], name: "index_models_on_make_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "car_id"
    t.integer "proton"
    t.integer "produa"
    t.integer "others"
  end

  create_table "service_partners", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "admin"
    t.integer "status"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string "key", limit: 40
    t.string "value", limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "idx_key"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "make"
    t.string "model"
    t.string "location"
    t.string "date"
    t.string "transfer"
    t.string "cash"
    t.string "service"
    t.string "region"
  end

end
