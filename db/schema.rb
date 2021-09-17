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

ActiveRecord::Schema.define(version: 2021_09_14_233042) do

  create_table "cart_items", force: :cascade do |t|
    t.integer "amount", null: false
    t.integer "customer_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shop_id"
    t.index ["customer_id"], name: "index_cart_items_on_customer_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
    t.index ["shop_id"], name: "index_cart_items_on_shop_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "store_name", null: false
    t.string "store_manager", null:key => "value" false
    t.string "address", null: false
    t.string "postal_code", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_favorites_on_customer_id"
    t.index ["shop_id"], name: "index_favorites_on_shop_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name", null: false
    t.integer "item_price", null: false
    t.integer "item_genre", null: false
    t.string "item_image_id"
    t.text "item_introduction", null: false
    t.boolean "sale_status"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_items_on_shop_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "room_id"
    t.boolean "is_customer", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "content"
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "price", null: false
    t.integer "amount", null: false
    t.integer "order_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "total_price", null: false
    t.integer "payment", null: false
    t.date "delivery_on", null: false
    t.integer "order_postage", null: false
    t.integer "delivery_status", default: 0, null: false
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "shop_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["shop_id"], name: "index_orders_on_shop_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "shop_id"
    t.text "content"
    t.float "rate", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
    t.index ["shop_id"], name: "index_reviews_on_shop_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_rooms_on_customer_id"
    t.index ["shop_id"], name: "index_rooms_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "shop_name", null: false
    t.string "manager", null: false
    t.text "introduction"
    t.string "shop_image_id"
    t.integer "shop_genre", null: false
    t.string "address", null: false
    t.string "postal_code", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_shops_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shops_on_reset_password_token", unique: true
  end

end
