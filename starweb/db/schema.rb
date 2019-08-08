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

ActiveRecord::Schema.define(version: 2019_08_05_121207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "doc_ruc"
    t.string "telephone"
    t.date "date_nac"
    t.string "mail"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "has_details", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "order_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_detail_id"], name: "index_has_details_on_order_detail_id"
    t.index ["order_id"], name: "index_has_details_on_order_id"
  end

  create_table "has_products", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.string "specs_f"
    t.string "specs_b"
    t.integer "quantity"
    t.string "color"
    t.string "design"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "design_file_name"
    t.string "design_content_type"
    t.bigint "design_file_size"
    t.datetime "design_updated_at"
    t.index ["order_id"], name: "index_has_products_on_order_id"
    t.index ["product_id"], name: "index_has_products_on_product_id"
  end

  create_table "has_sponsors", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "sponsor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_has_sponsors_on_order_id"
    t.index ["sponsor_id"], name: "index_has_sponsors_on_sponsor_id"
  end

  create_table "has_supplies", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "supply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_has_supplies_on_product_id"
    t.index ["supply_id"], name: "index_has_supplies_on_supply_id"
  end

  create_table "invoicing_ledger_items", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "recipient_id"
    t.string "type"
    t.datetime "issue_date"
    t.string "currency", limit: 3, null: false
    t.decimal "total_amount", precision: 20, scale: 4
    t.decimal "tax_amount", precision: 20, scale: 4
    t.string "status", limit: 20
    t.string "identifier", limit: 50
    t.string "description"
    t.datetime "period_start"
    t.datetime "period_end"
    t.string "uuid", limit: 40
    t.datetime "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_invoicing_ledger_items_on_recipient_id"
    t.index ["sender_id"], name: "index_invoicing_ledger_items_on_sender_id"
  end

  create_table "invoicing_line_items", force: :cascade do |t|
    t.bigint "ledger_item_id"
    t.string "type"
    t.decimal "net_amount", precision: 20, scale: 4
    t.decimal "tax_amount", precision: 20, scale: 4
    t.string "description"
    t.string "uuid", limit: 40
    t.datetime "tax_point"
    t.integer "quantity"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ledger_item_id"], name: "index_invoicing_line_items_on_ledger_item_id"
  end

  create_table "invoicing_tax_rates", force: :cascade do |t|
    t.string "description"
    t.decimal "rate", precision: 20, scale: 4
    t.datetime "valid_from", null: false
    t.datetime "valid_until"
    t.integer "replaced_by_id"
    t.boolean "is_default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date "deliver_date"
    t.bigint "client_id"
    t.string "course_club"
    t.string "logo"
    t.string "state", default: "En espera"
    t.integer "paid", default: 0
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.bigint "logo_file_size"
    t.datetime "logo_updated_at"
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 20, scale: 4
    t.string "image"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "quotations", force: :cascade do |t|
    t.bigint "currency_id"
    t.string "purchase"
    t.string "sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["currency_id"], name: "index_quotations_on_currency_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "num_clients"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "supplies", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "stock"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "firstname"
    t.string "lastname"
    t.date "birth"
    t.string "docnum"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "phone"
    t.string "permission_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "has_details", "order_details"
  add_foreign_key "has_details", "orders"
  add_foreign_key "has_products", "orders"
  add_foreign_key "has_products", "products"
  add_foreign_key "has_sponsors", "orders"
  add_foreign_key "has_sponsors", "sponsors"
  add_foreign_key "has_supplies", "products"
  add_foreign_key "has_supplies", "supplies"
  add_foreign_key "orders", "clients"
  add_foreign_key "quotations", "currencies"
end
