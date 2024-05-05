# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_05_05_021829) do
  create_table "addresses", force: :cascade do |t|
    t.string "street_address"
    t.string "complement"
    t.string "zipcode"
    t.integer "country_id", null: false
    t.integer "state_id", null: false
    t.integer "city_id", null: false
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "quantity"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_inventories_on_product_id"
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.string "icon_image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.integer "cost_price"
    t.integer "sale_price"
    t.boolean "is_third_party"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "model_id", null: false
    t.index ["model_id"], name: "index_products_on_model_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "countries"
  add_foreign_key "addresses", "customers"
  add_foreign_key "addresses", "states"
  add_foreign_key "cities", "states"
  add_foreign_key "inventories", "products"
  add_foreign_key "products", "models"
  add_foreign_key "states", "countries"
end
