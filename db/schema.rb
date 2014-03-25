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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140304124814) do

  create_table "TblSoStdCom", id: false, force: true do |t|
    t.string "CommentCode", limit: 3,  null: false
    t.string "Comment",     limit: 45, null: false
  end

  create_table "account_widgets", primary_key: "account_widget_id", force: true do |t|
    t.integer "widget_id",               null: false
    t.integer "foreign_key", default: 1, null: false
    t.integer "sort_order",  default: 0, null: false
  end

  create_table "ad_campaign_ads", primary_key: "ad_campaign_ad_id", force: true do |t|
    t.integer "campaign_id", null: false
    t.integer "ad_id",       null: false
    t.integer "sort_order"
  end

  add_index "ad_campaign_ads", ["ad_id"], name: "ad_id", using: :btree
  add_index "ad_campaign_ads", ["campaign_id"], name: "campaign_id", using: :btree

  create_table "ad_campaigns", primary_key: "ad_campaign_id", force: true do |t|
    t.integer   "zone_id",                null: false
    t.string    "name",       limit: 128, null: false
    t.timestamp "start_date",             null: false
  end

  add_index "ad_campaigns", ["zone_id"], name: "zone_id", using: :btree

  create_table "ad_zones", primary_key: "ad_zone_id", force: true do |t|
    t.string  "nickname",  limit: 64
    t.boolean "splitable",            default: false, null: false
  end

  create_table "admin_password_tokens", primary_key: "token_id", force: true do |t|
    t.integer   "admin_id",              null: false
    t.string    "token",      limit: 16, null: false
    t.timestamp "expiration",            null: false
  end

  add_index "admin_password_tokens", ["admin_id"], name: "admin_id", using: :btree
  add_index "admin_password_tokens", ["token"], name: "token", unique: true, using: :btree

  create_table "admin_permissions", primary_key: "admin_permission_id", force: true do |t|
    t.integer "admin_id",                            null: false
    t.string  "code",     limit: 64,                 null: false
    t.boolean "allowed",             default: false, null: false
  end

  create_table "admin_reports", primary_key: "admin_report_id", force: true do |t|
    t.string    "title",           limit: 32, default: "admin report", null: false
    t.timestamp "max_date"
    t.timestamp "min_date"
    t.text      "selected_fields"
    t.string    "sales_rep",       limit: 8
    t.string    "coupon_code",     limit: 16
    t.string    "ubd_code",        limit: 16
  end

  add_index "admin_reports", ["title"], name: "title", unique: true, using: :btree

  create_table "administrators", primary_key: "admin_id", force: true do |t|
    t.string  "name",             limit: 256, null: false
    t.string  "email",            limit: 256, null: false
    t.string  "password",         limit: 40,  null: false
    t.integer "permission_level",             null: false
    t.string  "salt",             limit: 40,  null: false
  end

  add_index "administrators", ["email"], name: "email", unique: true, using: :btree

  create_table "ads", primary_key: "ad_id", force: true do |t|
    t.string "nickname", limit: 128
    t.string "image",    limit: 256, null: false
    t.string "href",     limit: 256, null: false
    t.string "alt_text", limit: 256
  end

  create_table "api_keys", force: true do |t|
    t.string "key"
  end

  add_index "api_keys", ["key"], name: "index_api_keys_on_key", using: :btree

  create_table "api_users", force: true do |t|
    t.string "username"
    t.string "password_digest"
  end

  add_index "api_users", ["username"], name: "index_api_users_on_username", using: :btree

  create_table "attribute_values", primary_key: "attribute_value_id", force: true do |t|
    t.integer "attribute_id",                              null: false
    t.string  "value",         limit: 256,                 null: false
    t.integer "value_integer",             default: 0
    t.float   "value_decimal",             default: 0.0
    t.boolean "value_boolean",             default: false
    t.string  "image",         limit: 256,                 null: false
    t.string  "alt",           limit: 256
    t.string  "href"
  end

  add_index "attribute_values", ["attribute_id", "value"], name: "attribute_id_2", unique: true, using: :btree
  add_index "attribute_values", ["attribute_id"], name: "attribute_id", using: :btree
  add_index "attribute_values", ["value_boolean"], name: "index_attribute_values_on_value_boolean", using: :btree
  add_index "attribute_values", ["value_decimal"], name: "index_attribute_values_on_value_decimal", using: :btree
  add_index "attribute_values", ["value_integer"], name: "index_attribute_values_on_value_integer", using: :btree

  create_table "attributes", primary_key: "attribute_id", force: true do |t|
    t.string  "name",            limit: 256,                    null: false
    t.boolean "display",                     default: false,    null: false
    t.boolean "narrow",                                         null: false
    t.boolean "advanced_search",             default: false,    null: false
    t.string  "alt",             limit: 256
    t.integer "sort",                        default: 0,        null: false
    t.integer "amazon",          limit: 1,   default: 0,        null: false
    t.string  "amazon_name",     limit: 100,                    null: false
    t.string  "type",            limit: 10,  default: "string"
    t.integer "unit_id"
    t.string  "format"
    t.string  "short_format"
  end

  add_index "attributes", ["name"], name: "name", using: :btree
  add_index "attributes", ["type"], name: "index_attributes_on_type", using: :btree
  add_index "attributes", ["unit_id"], name: "index_attributes_on_unit_id", using: :btree

  create_table "audit_log", primary_key: "audit_log_id", force: true do |t|
    t.integer   "user_id",    null: false
    t.string    "user_name",  null: false
    t.string    "class_name", null: false
    t.integer   "object_id",  null: false
    t.timestamp "timestamp",  null: false
    t.string    "field",      null: false
    t.string    "old_value",  null: false
    t.string    "new_value",  null: false
  end

  add_index "audit_log", ["class_name", "object_id"], name: "specific_object", using: :btree
  add_index "audit_log", ["class_name"], name: "class_name", using: :btree
  add_index "audit_log", ["object_id"], name: "object_id", using: :btree
  add_index "audit_log", ["user_id"], name: "user_id", using: :btree

  create_table "audit_log_fields", primary_key: "audit_log_field_id", force: true do |t|
    t.integer "group_id"
    t.string  "field"
    t.string  "old_value"
    t.string  "new_value"
  end

  add_index "audit_log_fields", ["field"], name: "index_audit_log_fields_on_field", using: :btree
  add_index "audit_log_fields", ["group_id"], name: "index_audit_log_fields_on_group_id", using: :btree

  create_table "audit_log_groups", primary_key: "audit_log_group_id", force: true do |t|
    t.integer   "user_id"
    t.string    "user_name"
    t.string    "class_name"
    t.integer   "object_id"
    t.timestamp "timestamp"
  end

  add_index "audit_log_groups", ["class_name"], name: "index_audit_log_groups_on_class_name", using: :btree
  add_index "audit_log_groups", ["object_id"], name: "index_audit_log_groups_on_object_id", using: :btree
  add_index "audit_log_groups", ["timestamp"], name: "index_audit_log_groups_on_timestamp", using: :btree
  add_index "audit_log_groups", ["user_id"], name: "index_audit_log_groups_on_user_id", using: :btree

  create_table "auth_total_log", primary_key: "auth_total_id", force: true do |t|
    t.integer "order_id",                null: false
    t.string  "order_total", limit: 128
    t.string  "auth_total",  limit: 128
  end

  add_index "auth_total_log", ["order_id"], name: "order_id", using: :btree

  create_table "base_cost_change_logs", force: true do |t|
    t.integer  "product_id"
    t.decimal  "old_base_cost", precision: 15, scale: 2
    t.decimal  "new_base_cost", precision: 15, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "base_cost_change_logs", ["product_id"], name: "index_base_cost_change_logs_on_product_id", using: :btree

  create_table "base_cost_lookup", primary_key: "product_id", force: true do |t|
    t.string "catalog_code",   limit: 32,               null: false
    t.float  "admin_override",            default: 0.0, null: false
    t.float  "syspro_cost",               default: 0.0, null: false
  end

  add_index "base_cost_lookup", ["catalog_code"], name: "catalog_code", using: :btree

  create_table "base_cost_tool", primary_key: "base_cost_tool_id", force: true do |t|
    t.integer   "product_id",                                null: false
    t.timestamp "date",                                      null: false
    t.float     "curr_base_cost",                            null: false
    t.float     "curr_markup",                               null: false
    t.float     "curr_final_price",                          null: false
    t.float     "new_base_price",                            null: false
    t.float     "new_markup",                                null: false
    t.float     "new_final_price",                           null: false
    t.string    "cost_flux",        limit: 10, default: "0", null: false
  end

  create_table "box_overrides", primary_key: "box_override_id", force: true do |t|
    t.integer "product_id",   null: false
    t.integer "length",       null: false
    t.integer "height",       null: false
    t.integer "width",        null: false
    t.integer "weight",       null: false
    t.integer "min_quantity", null: false
    t.integer "max_quantity", null: false
  end

  add_index "box_overrides", ["product_id"], name: "product_id", using: :btree

  create_table "bulb_shapes", primary_key: "shape_id", force: true do |t|
    t.integer "parent_id",             null: false
    t.string  "name",      limit: 256, null: false
    t.string  "image",     limit: 256, null: false
  end

  add_index "bulb_shapes", ["parent_id"], name: "parent_id", using: :btree

  create_table "bv_ratings", primary_key: "rating_id", force: true do |t|
    t.integer "product_id",                                 null: false
    t.integer "number_of_ratings",                          null: false
    t.decimal "rating_average",    precision: 37, scale: 2, null: false
  end

  add_index "bv_ratings", ["product_id"], name: "product_id", using: :btree

  create_table "categories", primary_key: "category_id", force: true do |t|
    t.integer "parent_id",                       default: 0,        null: false
    t.boolean "active",                          default: true,     null: false
    t.string  "name",                limit: 256,                    null: false
    t.string  "long_name",           limit: 256
    t.string  "url",                 limit: 256,                    null: false
    t.boolean "nav",                             default: false,    null: false
    t.integer "sort_order",                                         null: false
    t.text    "header",                                             null: false
    t.text    "footer",                                             null: false
    t.string  "image",               limit: 256,                    null: false
    t.integer "nav_column_id",                                      null: false
    t.integer "nav_sort_order",                                     null: false
    t.string  "nav_column_name",                                    null: false
    t.text    "admin_note",                                         null: false
    t.string  "view",                limit: 6,   default: "normal", null: false
    t.string  "desc_2",              limit: 64,                     null: false
    t.string  "desc_3",              limit: 64,                     null: false
    t.boolean "show_name",                       default: true,     null: false
    t.string  "list_name",           limit: 256,                    null: false
    t.boolean "sales_only",                      default: false,    null: false
    t.text    "meta_description"
    t.text    "meta_keywords"
    t.string  "title_override",      limit: 256
    t.string  "header_title",        limit: 256,                    null: false
    t.string  "header_desc",         limit: 256,                    null: false
    t.string  "header_img",          limit: 256,                    null: false
    t.integer "category_recs",       limit: 1,   default: 0,        null: false
    t.text    "include_tag",                                        null: false
    t.text    "exclude_tag",                                        null: false
    t.integer "basecost",            limit: 1,   default: 0,        null: false
    t.string  "lander"
    t.boolean "backorders_disabled",             default: false
    t.string  "canonical_url"
  end

  add_index "categories", ["nav"], name: "nav", using: :btree
  add_index "categories", ["nav_column_id"], name: "nav_column_id", using: :btree
  add_index "categories", ["parent_id"], name: "parent_id", using: :btree
  add_index "categories", ["url"], name: "url", unique: true, using: :btree

  create_table "category_legacy_url", primary_key: "category_legacy_url_id", force: true do |t|
    t.integer   "category_id", null: false
    t.string    "legacy_url",  null: false
    t.timestamp "date",        null: false
  end

  create_table "category_meta_tags", primary_key: "category_meta_tag_id", force: true do |t|
    t.integer "category_id", null: false
    t.integer "meta_tag_id", null: false
  end

  add_index "category_meta_tags", ["category_id"], name: "category_id", using: :btree
  add_index "category_meta_tags", ["meta_tag_id"], name: "meta_tag_id", using: :btree

  create_table "category_nav_item_columns", primary_key: "category_nav_item_column_id", force: true do |t|
    t.integer "nav_item_id", null: false
    t.integer "sort_order",  null: false
  end

  add_index "category_nav_item_columns", ["nav_item_id"], name: "nav_item_id", using: :btree

  create_table "category_nav_items", primary_key: "category_nav_item_id", force: true do |t|
    t.integer "category_id", null: false
    t.integer "sort_order",  null: false
    t.string  "name",        null: false
    t.string  "url",         null: false
  end

  create_table "category_options", force: true do |t|
    t.integer "category_id"
    t.string  "key"
    t.string  "value"
  end

  add_index "category_options", ["category_id", "key"], name: "index_category_options_on_category_id_and_key", using: :btree
  add_index "category_options", ["category_id"], name: "index_category_options_on_category_id", using: :btree
  add_index "category_options", ["key"], name: "index_category_options_on_key", using: :btree

  create_table "category_products", primary_key: "category_product_id", force: true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  add_index "category_products", ["category_id"], name: "index_category_products_on_category_id", using: :btree
  add_index "category_products", ["product_id"], name: "index_category_products_on_product_id", using: :btree

  create_table "category_support_numbers", primary_key: "category_support_number_id", force: true do |t|
    t.integer "category_id"
    t.string  "support_number"
  end

  add_index "category_support_numbers", ["category_id"], name: "index_category_support_numbers_on_category_id", unique: true, using: :btree

  create_table "category_visible_attribute_excluded_products", primary_key: "category_visible_attribute_excluded_product_id", force: true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  add_index "category_visible_attribute_excluded_products", ["category_id"], name: "category_visible_excluded_products_cat_id", using: :btree

  create_table "category_visible_attributes", primary_key: "category_visible_attribute_id", force: true do |t|
    t.integer "category_id"
    t.integer "attribute_id"
  end

  add_index "category_visible_attributes", ["category_id"], name: "index_category_visible_attributes_on_category_id", using: :btree

  create_table "category_widgets", primary_key: "category_widget_id", force: true do |t|
    t.integer "category_id", null: false
    t.integer "widget_id",   null: false
    t.integer "sort_order",  null: false
  end

  add_index "category_widgets", ["category_id"], name: "category_id", using: :btree
  add_index "category_widgets", ["widget_id"], name: "widget_id", using: :btree

  create_table "comparable_products", primary_key: "comparable_id", force: true do |t|
    t.integer "product_id",               null: false
    t.string  "comparable_catalog_codes"
  end

  add_index "comparable_products", ["product_id"], name: "index_comparable_products_on_product_id", using: :btree

  create_table "config", primary_key: "config_id", force: true do |t|
    t.string "config_key",   limit: 256, null: false
    t.string "config_value", limit: 256, null: false
    t.text   "config_text"
  end

  add_index "config", ["config_key"], name: "config_key", unique: true, using: :btree

  create_table "contact_us", primary_key: "contact_us_id", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company_name"
    t.string   "email"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.integer  "order_id"
    t.text     "comments"
    t.string   "server_name"
    t.boolean  "email_sent",   default: false
    t.boolean  "archived",     default: false
    t.boolean  "deleted",      default: false
    t.datetime "created_date"
  end

  add_index "contact_us", ["archived", "deleted"], name: "index_contact_us_on_archived_and_deleted", using: :btree
  add_index "contact_us", ["deleted"], name: "index_contact_us_on_deleted", using: :btree

  create_table "countries", primary_key: "country_id", force: true do |t|
    t.string "syspro_code", limit: 3, null: false
    t.string "name",                  null: false
  end

  create_table "coupon_categories", primary_key: "coupon_category_id", force: true do |t|
    t.integer "coupon_id",   null: false
    t.integer "category_id", null: false
  end

  add_index "coupon_categories", ["coupon_id"], name: "coupon_id", using: :btree

  create_table "coupon_codes", primary_key: "coupon_code_id", force: true do |t|
    t.integer "coupon_id"
    t.string  "code"
  end

  add_index "coupon_codes", ["code"], name: "index_coupon_codes_on_code", unique: true, using: :btree
  add_index "coupon_codes", ["coupon_id"], name: "index_coupon_codes_on_coupon_id", using: :btree

  create_table "coupon_products", primary_key: "coupon_product_id", force: true do |t|
    t.integer "coupon_id",  null: false
    t.integer "product_id", null: false
  end

  add_index "coupon_products", ["coupon_id"], name: "coupon_id", using: :btree
  add_index "coupon_products", ["product_id"], name: "product_id", using: :btree

  create_table "coupons", primary_key: "coupon_id", force: true do |t|
    t.string  "nickname",       limit: 128,                                          null: false
    t.string  "description",    limit: 256,                                          null: false
    t.boolean "discount_type",                                                       null: false
    t.decimal "discount_value",             precision: 15, scale: 2,                 null: false
    t.date    "start_date",                                                          null: false
    t.date    "end_date",                                                            null: false
    t.boolean "all_products",                                        default: false, null: false
  end

  create_table "credit_cards", primary_key: "credit_card_id", force: true do |t|
    t.integer "customer_id",                               null: false
    t.string  "name",          limit: 128,                 null: false
    t.string  "nickname",      limit: 256,                 null: false
    t.binary  "expires_month",                             null: false
    t.binary  "expires_year",                              null: false
    t.string  "type",          limit: 8,                   null: false
    t.string  "token"
    t.string  "last_four",     limit: 4
    t.boolean "expired",                   default: false
  end

  add_index "credit_cards", ["customer_id"], name: "customer_id", using: :btree
  add_index "credit_cards", ["expired"], name: "index_credit_cards_on_expired", using: :btree

  create_table "custom_fedex_options", primary_key: "custom_fedex_option_id", force: true do |t|
    t.string "fedex_code",  limit: 50, null: false
    t.string "syspro_code", limit: 8,  null: false
  end

  add_index "custom_fedex_options", ["fedex_code"], name: "fedex_code", using: :btree

  create_table "custom_shipping_discounts", primary_key: "custom_shipping_discounts_id", force: true do |t|
    t.string  "zip_code",            limit: 5, null: false
    t.integer "discount_percentage",           null: false
  end

  create_table "custom_shipping_fees", primary_key: "custom_shipping_fee_id", force: true do |t|
    t.float "minimum_cost", default: 0.0, null: false
    t.float "handling_fee", default: 0.0, null: false
  end

  create_table "custom_shipping_options", primary_key: "custom_shipping_option_id", force: true do |t|
    t.string "name",        limit: 32,                  null: false
    t.string "syspro_type", limit: 8,  default: "null", null: false
  end

  create_table "custom_ups_options", primary_key: "custom_ups_option_id", force: true do |t|
    t.string "ups_code",    limit: 8,                  null: false
    t.string "syspro_code", limit: 8, default: "null", null: false
  end

  add_index "custom_ups_options", ["ups_code"], name: "ups_code", using: :btree

  create_table "customer_address_types", primary_key: "address_type_id", force: true do |t|
    t.integer "customer_id"
    t.integer "type"
    t.integer "address_id"
  end

  add_index "customer_address_types", ["address_id"], name: "index_customer_address_types_on_address_id", unique: true, using: :btree

  create_table "customer_addresses", primary_key: "address_id", force: true do |t|
    t.integer "customer_id",             null: false
    t.string  "nickname",    limit: 256, null: false
    t.string  "name",        limit: 256
    t.string  "company",     limit: 256, null: false
    t.string  "attention",   limit: 265
    t.string  "address_1",   limit: 256, null: false
    t.string  "address_2",   limit: 256, null: false
    t.string  "address_3",   limit: 256, null: false
    t.string  "city",        limit: 256, null: false
    t.string  "state",       limit: 256, null: false
    t.string  "zip_code",    limit: 6,   null: false
    t.string  "phone",       limit: 32,  null: false
    t.string  "ext",         limit: 10,  null: false
    t.string  "country",     limit: 256, null: false
  end

  add_index "customer_addresses", ["address_1"], name: "address_1", type: :fulltext
  add_index "customer_addresses", ["address_2"], name: "address_2", type: :fulltext
  add_index "customer_addresses", ["address_3"], name: "address_3", type: :fulltext
  add_index "customer_addresses", ["city"], name: "city", type: :fulltext
  add_index "customer_addresses", ["company"], name: "company", type: :fulltext
  add_index "customer_addresses", ["customer_id"], name: "customer_id", using: :btree
  add_index "customer_addresses", ["phone"], name: "phone", type: :fulltext
  add_index "customer_addresses", ["state"], name: "state", type: :fulltext
  add_index "customer_addresses", ["zip_code"], name: "zip_code", type: :fulltext

  create_table "customer_cart_products", primary_key: "cart_product_id", force: true do |t|
    t.integer "customer_id", null: false
    t.integer "product_id",  null: false
    t.integer "quantity",    null: false
  end

  add_index "customer_cart_products", ["customer_id", "product_id"], name: "customer_id_2", unique: true, using: :btree
  add_index "customer_cart_products", ["customer_id"], name: "customer_id", using: :btree

  create_table "customer_email_preferences", primary_key: "customer_email_preference_id", force: true do |t|
    t.integer "customer_id",                            null: false
    t.integer "subscribe_opt_in", limit: 1, default: 0, null: false
  end

  add_index "customer_email_preferences", ["customer_id"], name: "index_customer_email_preferences_on_customer_id", unique: true, using: :btree
  add_index "customer_email_preferences", ["subscribe_opt_in"], name: "index_customer_email_preferences_on_subscribe_opt_in", using: :btree

  create_table "customer_reports", primary_key: "customer_report_id", force: true do |t|
    t.integer   "customer_id",                                   null: false
    t.string    "title",           limit: 32, default: "Orders", null: false
    t.timestamp "max_date"
    t.timestamp "min_date"
    t.text      "selected_fields"
  end

  add_index "customer_reports", ["customer_id", "title"], name: "customer_id_2", unique: true, using: :btree
  add_index "customer_reports", ["customer_id"], name: "customer_id", using: :btree

  create_table "customer_search_index", primary_key: "record_id", force: true do |t|
    t.integer "customer_address_id", null: false
    t.string  "field",               null: false
    t.string  "token",               null: false
    t.float   "score"
  end

  add_index "customer_search_index", ["customer_address_id"], name: "customer_address_id", using: :btree
  add_index "customer_search_index", ["token"], name: "token", using: :btree

  create_table "customer_shipping_options", primary_key: "customer_shipping_option_id", force: true do |t|
    t.integer "customer_id",                          null: false
    t.integer "custom_shipping_option_id",            null: false
    t.string  "account_number",            limit: 32, null: false
  end

  add_index "customer_shipping_options", ["custom_shipping_option_id"], name: "custom_shipping_option_id", using: :btree
  add_index "customer_shipping_options", ["customer_id"], name: "customer_id", using: :btree

  create_table "customers", primary_key: "customer_id", force: true do |t|
    t.string    "account_type",             limit: 24,                           default: "Personal", null: false
    t.string    "name",                     limit: 256,                                               null: false
    t.string    "email",                    limit: 256,                                               null: false
    t.string    "secondary_email",          limit: 256
    t.string    "password",                 limit: 40,                                                null: false
    t.timestamp "date_registered",                                                                    null: false
    t.timestamp "last_login",                                                                         null: false
    t.integer   "sales_rep",                                                                          null: false
    t.string    "salt",                     limit: 40,                                                null: false
    t.integer   "default_shipping"
    t.integer   "default_billing"
    t.float     "shipping_discount",                                             default: 0.0,        null: false
    t.boolean   "tax_exempt",                                                    default: false,      null: false
    t.decimal   "credit_limit",                         precision: 15, scale: 2, default: 0.0,        null: false
    t.boolean   "password_change_required",                                      default: false,      null: false
    t.string    "company",                  limit: 256
    t.string    "phone",                    limit: 20
    t.boolean   "on_hold",                                                       default: false,      null: false
    t.decimal   "credit_balance",                       precision: 15, scale: 2, default: 0.0,        null: false
    t.string    "terms_code",               limit: 3
  end

  add_index "customers", ["email", "password"], name: "email_2", using: :btree
  add_index "customers", ["email"], name: "email", unique: true, using: :btree
  add_index "customers", ["name"], name: "name", using: :btree
  add_index "customers", ["sales_rep"], name: "sales_rep", using: :btree

  create_table "customers_global_markup", primary_key: "global_markup_id", force: true do |t|
    t.integer "customer_id",                                          null: false
    t.decimal "global_markup", precision: 10, scale: 3, default: 0.0, null: false
  end

  add_index "customers_global_markup", ["customer_id"], name: "index_customers_global_markup_on_customer_id", using: :btree

  create_table "freight_boxes", primary_key: "freight_box_id", force: true do |t|
    t.integer "length"
    t.integer "width"
    t.integer "height"
    t.integer "dim_weight"
    t.integer "sort_order"
    t.boolean "custom",     default: false, null: false
  end

  add_index "freight_boxes", ["custom"], name: "index_freight_boxes_on_custom", using: :btree
  add_index "freight_boxes", ["height", "width", "length"], name: "freight_dimensions", using: :btree
  add_index "freight_boxes", ["sort_order"], name: "index_freight_boxes_on_sort_order", using: :btree

  create_table "freight_overrides", primary_key: "freight_override_id", force: true do |t|
    t.float  "minimum_value",            null: false
    t.float  "freight_value",            null: false
    t.string "freight_type",  limit: 32, null: false
  end

  create_table "freight_overrides_excludes", primary_key: "freight_overrides_excludes_id", force: true do |t|
    t.string "excluded_state", limit: 45, null: false
  end

  create_table "giant_order_log", primary_key: "giant_order_log_id", force: true do |t|
    t.integer   "order_id",  null: false
    t.timestamp "timestamp", null: false
  end

  add_index "giant_order_log", ["order_id"], name: "order_id", using: :btree

  create_table "global_product_tabs", primary_key: "global_tab_id", force: true do |t|
    t.string  "title",        limit: 128, null: false
    t.integer "sort_order",               null: false
    t.string  "type",         limit: 32,  null: false
    t.boolean "default_view",             null: false
    t.text    "data",                     null: false
  end

  create_table "global_widgets", primary_key: "global_widget_id", force: true do |t|
    t.integer "widget_id",   null: false
    t.integer "foreign_key", null: false
    t.integer "sort_order",  null: false
  end

  add_index "global_widgets", ["widget_id"], name: "widget_id", using: :btree

  create_table "homepage_products", force: true do |t|
    t.integer "product_id", null: false
    t.integer "sort_order"
  end

  add_index "homepage_products", ["product_id"], name: "product_id", using: :btree

  create_table "invoice_detail", primary_key: "invoice_detail_id", force: true do |t|
    t.integer "invoice_id",                 null: false
    t.integer "qty_ordered"
    t.integer "qty_invoiced"
    t.string  "stock_code",      limit: 30
    t.float   "net_sales_value"
    t.string  "product_class",   limit: 4
  end

  add_index "invoice_detail", ["invoice_id"], name: "invoice_id", using: :btree

  create_table "invoices", primary_key: "invoice_id", force: true do |t|
    t.string   "syspro_id",         limit: 6,  null: false
    t.string   "order_id",          limit: 24, null: false
    t.datetime "date",                         null: false
    t.string   "po_number",         limit: 30
    t.string   "terms_code",        limit: 2
    t.float    "merchandise_value"
    t.float    "freight_value"
    t.float    "tax_value"
    t.float    "currency_value"
  end

  add_index "invoices", ["order_id"], name: "order_id", using: :btree
  add_index "invoices", ["syspro_id"], name: "syspro_id", using: :btree

  create_table "legacy_redirect_lookups", primary_key: "legacy_redirect_lookup_id", force: true do |t|
    t.string "legacy_url",      limit: 256, null: false
    t.string "current_url",     limit: 256, null: false
    t.string "legacy_url_hash", limit: 40,  null: false
  end

  add_index "legacy_redirect_lookups", ["legacy_url"], name: "legacy_url", using: :btree
  add_index "legacy_redirect_lookups", ["legacy_url_hash"], name: "legacy_url_hash", using: :btree

  create_table "manufacturers", primary_key: "manufacturer_id", force: true do |t|
    t.string "name"
    t.string "image"
  end

  add_index "manufacturers", ["name"], name: "index_manufacturers_on_name", unique: true, using: :btree

  create_table "meta_tags", primary_key: "meta_tag_id", force: true do |t|
    t.string "name",    limit: 256, null: false
    t.text   "content",             null: false
  end

  create_table "misc_charges", primary_key: "misc_charge_id", force: true do |t|
    t.string  "comment_code", limit: 3,                  null: false
    t.string  "description",  limit: 64,                 null: false
    t.boolean "active",                  default: false, null: false
  end

  add_index "misc_charges", ["comment_code"], name: "comment_code", using: :btree

  create_table "order_cancel_reasons", primary_key: "order_cancel_reason_id", force: true do |t|
    t.string "reason_code", limit: 64,  null: false
    t.string "reason_text", limit: 128, null: false
  end

  create_table "order_change_history", primary_key: "order_change_id", force: true do |t|
    t.integer   "order_id",                                null: false
    t.integer   "sales_rep",                               null: false
    t.string    "change_type",  limit: 64,                 null: false
    t.timestamp "timestamp",                               null: false
    t.text      "description"
    t.boolean   "syspro",                  default: false, null: false
    t.string    "cancel_code",  limit: 16
    t.string    "cc_trans_id",  limit: 16
    t.string    "cc_auth_code", limit: 16
  end

  add_index "order_change_history", ["order_id"], name: "order_id", using: :btree

  create_table "order_change_item", primary_key: "order_change_item_id", force: true do |t|
    t.integer "order_change_id",            null: false
    t.string  "change_type",     limit: 64, null: false
    t.string  "stock_code",      limit: 64, null: false
    t.string  "value",           limit: 64, null: false
  end

  add_index "order_change_item", ["order_change_id"], name: "order_change_id", using: :btree

  create_table "order_exception_logs", force: true do |t|
    t.integer  "order_id"
    t.boolean  "exceptions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
    t.string   "hostname",   default: "unknown"
  end

  add_index "order_exception_logs", ["exceptions"], name: "index_order_exception_logs_on_exceptions", using: :btree
  add_index "order_exception_logs", ["hostname"], name: "index_order_exception_logs_on_hostname", using: :btree
  add_index "order_exception_logs", ["order_id"], name: "index_order_exception_logs_on_order_id", using: :btree

  create_table "order_exception_rules", force: true do |t|
    t.string   "recipient_list"
    t.string   "message"
    t.string   "config"
    t.boolean  "suspend_order",  default: true
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_line_items", primary_key: "item_id", force: true do |t|
    t.integer "order_id",                                                       null: false
    t.string  "type",        limit: 16
    t.string  "name",        limit: 256,                                        null: false
    t.integer "sort_order",                                                     null: false
    t.decimal "unit_price",              precision: 15, scale: 2, default: 0.0, null: false
    t.decimal "final_price",             precision: 15, scale: 2,               null: false
    t.integer "quantity",                                         default: 1,   null: false
    t.integer "taxable",     limit: 1,                            default: 0,   null: false
  end

  add_index "order_line_items", ["order_id"], name: "order_id", using: :btree
  add_index "order_line_items", ["type"], name: "type", using: :btree

  create_table "order_products", primary_key: "order_product_id", force: true do |t|
    t.integer "item_id",                                               null: false
    t.integer "product_id",                                            null: false
    t.decimal "discounted_price",             precision: 15, scale: 2, null: false
    t.string  "ubd_code",         limit: 64
    t.string  "catalog_code",     limit: 256,                          null: false
    t.decimal "unit_cost",                    precision: 15, scale: 2
  end

  add_index "order_products", ["item_id"], name: "order_id", using: :btree
  add_index "order_products", ["product_id"], name: "product_id", using: :btree

  create_table "order_reports", primary_key: "order_report_id", force: true do |t|
    t.string  "user_type",       limit: 16, null: false
    t.integer "user_id",                    null: false
    t.string  "title",           limit: 32
    t.text    "filters"
    t.text    "selected_fields"
  end

  add_index "order_reports", ["title"], name: "title", using: :btree
  add_index "order_reports", ["user_id"], name: "user_id", using: :btree
  add_index "order_reports", ["user_type"], name: "user_type", using: :btree

  create_table "order_shipping_totals", id: false, force: true do |t|
    t.integer "order_id",                          null: false
    t.decimal "total",    precision: 37, scale: 2
  end

  create_table "order_status", primary_key: "order_status_id", force: true do |t|
    t.integer   "order_id",            null: false
    t.string    "status",    limit: 5
    t.timestamp "timestamp",           null: false
  end

  add_index "order_status", ["order_id"], name: "order_id", unique: true, using: :btree

  create_table "order_status_change_requests", primary_key: "order_status_change_request_id", force: true do |t|
    t.integer   "order_id",                                 null: false
    t.string    "new_status",     limit: 8,                 null: false
    t.boolean   "sent_to_syspro",           default: false, null: false
    t.timestamp "timestamp",                                null: false
  end

  create_table "order_subtotals", id: false, force: true do |t|
    t.integer "order_id",                          null: false
    t.decimal "subtotal", precision: 47, scale: 2
  end

  create_table "order_tax_totals", id: false, force: true do |t|
    t.integer "order_id",                          null: false
    t.decimal "total",    precision: 37, scale: 2
  end

  create_table "order_totals", id: false, force: true do |t|
    t.integer "order_id",                          null: false
    t.decimal "total",    precision: 65, scale: 2
  end

  create_table "order_tracking", primary_key: "order_tracking_id", force: true do |t|
    t.string "order_id",        limit: 20, null: false
    t.string "tracking_number", limit: 50
    t.string "shipper",         limit: 30
  end

  add_index "order_tracking", ["order_id", "tracking_number"], name: "index_order_tracking_on_order_id_and_tracking_number", unique: true, using: :btree
  add_index "order_tracking", ["order_id"], name: "order_id", using: :btree
  add_index "order_tracking", ["tracking_number"], name: "index_order_tracking_on_tracking_number", using: :btree

  create_table "orders", primary_key: "order_id", force: true do |t|
    t.integer   "customer_id",                                          null: false
    t.string    "sales_rep_id",         limit: 4
    t.integer   "coupon_id"
    t.timestamp "date_purchased",                                       null: false
    t.string    "status",               limit: 16,                      null: false
    t.string    "type",                 limit: 16,                      null: false
    t.string    "quote_type",           limit: 16,                      null: false
    t.timestamp "quote_expires",                                        null: false
    t.string    "shipping_name",        limit: 256,                     null: false
    t.string    "shipping_company",     limit: 256,                     null: false
    t.string    "shipping_attention",   limit: 256
    t.string    "shipping_address_1",   limit: 256,                     null: false
    t.string    "shipping_address_2",   limit: 256,                     null: false
    t.string    "shipping_address_3",   limit: 256,                     null: false
    t.string    "shipping_city",        limit: 256,                     null: false
    t.string    "shipping_state",       limit: 32,                      null: false
    t.string    "shipping_zip_code",    limit: 32,                      null: false
    t.string    "shipping_phone",       limit: 64,                      null: false
    t.string    "shipping_ext",         limit: 64
    t.string    "shipping_country",     limit: 3,                       null: false
    t.string    "billing_name",         limit: 256,                     null: false
    t.string    "billing_company",      limit: 256,                     null: false
    t.string    "billing_attention",    limit: 256
    t.string    "billing_address_1",    limit: 256,                     null: false
    t.string    "billing_address_2",    limit: 256,                     null: false
    t.string    "billing_address_3",    limit: 256,                     null: false
    t.string    "billing_city",         limit: 256,                     null: false
    t.string    "billing_state",        limit: 32,                      null: false
    t.string    "billing_zip_code",     limit: 32,                      null: false
    t.string    "billing_phone",        limit: 64,                      null: false
    t.string    "billing_ext",          limit: 64
    t.string    "billing_country",      limit: 3,                       null: false
    t.string    "po_number",            limit: 30
    t.string    "note",                 limit: 90
    t.boolean   "sent_to_syspro",                                       null: false
    t.string    "cc_name",              limit: 256,                     null: false
    t.string    "cc_number",            limit: 128,                     null: false
    t.string    "cc_expires_month",     limit: 128,                     null: false
    t.string    "cc_expires_year",      limit: 128,                     null: false
    t.string    "cc_trans_id",          limit: 16
    t.string    "cc_auth_code",         limit: 16,                      null: false
    t.string    "cc_ccv",               limit: 128,                     null: false
    t.string    "sales_note",           limit: 100
    t.boolean   "ship_complete",                    default: false,     null: false
    t.string    "syspro_status",        limit: 8,   default: "0",       null: false
    t.string    "warehouse",            limit: 8,   default: "00",      null: false
    t.string    "payment_term_id",      limit: 16,  default: "cc",      null: false
    t.string    "syspro_order_id",      limit: 16,  default: "pending", null: false
    t.string    "freight_account",      limit: 32
    t.string    "syspro_shipping_code", limit: 8,                       null: false
    t.string    "syspro_invoice_code",  limit: 8,                       null: false
    t.string    "shipping_address_id",  limit: 45,                      null: false
    t.string    "shipping_nickname",    limit: 45,                      null: false
    t.string    "billing_address_id",   limit: 45,                      null: false
    t.string    "billing_nickname",     limit: 45,                      null: false
    t.timestamp "ship_date"
    t.string    "shipping_email",       limit: 256
    t.string    "legacy_key",           limit: 20
    t.string    "view_token",           limit: 40
    t.string    "billing_email",        limit: 256
    t.boolean   "confirmation_sent",                default: false
    t.string    "shipping_telex",       limit: 30,  default: "C"
    t.string    "customer_note",        limit: 100,                     null: false
    t.string    "response_code",        limit: 8
    t.string    "response_reason",      limit: 8
    t.string    "syspro_hold_status",   limit: 1,   default: "1",       null: false
    t.integer   "quote_order_id"
    t.string    "split_flag",           limit: 1
    t.integer   "last_edit_by"
    t.string    "ship_rush",            limit: 1,   default: "0"
    t.string    "promotion_code"
    t.string    "cc_token"
    t.string    "cc_customer_code"
    t.boolean   "avs_check",                        default: true
  end

  add_index "orders", ["avs_check"], name: "index_orders_on_avs_check", using: :btree
  add_index "orders", ["coupon_id"], name: "coupon_id", using: :btree
  add_index "orders", ["customer_id"], name: "customer_id", using: :btree
  add_index "orders", ["date_purchased"], name: "date_purchased", using: :btree
  add_index "orders", ["date_purchased"], name: "date_purchased_index", using: :btree
  add_index "orders", ["legacy_key"], name: "legacy_key", using: :btree
  add_index "orders", ["promotion_code"], name: "index_orders_on_promotion_code", using: :btree
  add_index "orders", ["quote_order_id"], name: "mikes_awesome_quote_index", using: :btree
  add_index "orders", ["sales_rep_id"], name: "sales_rep_id", using: :btree
  add_index "orders", ["sales_rep_id"], name: "sales_rep_id_index", using: :btree
  add_index "orders", ["sent_to_syspro"], name: "sent_to_syspro_index", using: :btree
  add_index "orders", ["status"], name: "status_index", using: :btree
  add_index "orders", ["type"], name: "type_index", using: :btree
  add_index "orders", ["view_token"], name: "view_token", using: :btree

  create_table "page_meta_tags", primary_key: "page_meta_tag_id", force: true do |t|
    t.integer "page_id",     null: false
    t.integer "meta_tag_id", null: false
  end

  add_index "page_meta_tags", ["meta_tag_id"], name: "meta_tag_id", using: :btree
  add_index "page_meta_tags", ["page_id"], name: "page_id", using: :btree

  create_table "page_widgets", primary_key: "page_widget_id", force: true do |t|
    t.integer "page_id",    null: false
    t.integer "widget_id",  null: false
    t.integer "sort_order", null: false
  end

  add_index "page_widgets", ["page_id"], name: "page_id", using: :btree
  add_index "page_widgets", ["widget_id"], name: "widget_id", using: :btree

  create_table "pages", primary_key: "page_id", force: true do |t|
    t.string  "title",     limit: 256,                        null: false
    t.string  "url",       limit: 256,                        null: false
    t.string  "nickname",  limit: 256,                        null: false
    t.text    "content",   limit: 2147483647,                 null: false
    t.boolean "full_page",                    default: false, null: false
    t.text    "css",                                          null: false
  end

  add_index "pages", ["url"], name: "url", using: :btree

  create_table "payment_terms", primary_key: "payment_term_id", force: true do |t|
    t.string  "syspro_code", limit: 2,                   null: false
    t.string  "name",        limit: 16
    t.integer "sort",                   default: 100000, null: false
    t.integer "show",        limit: 1,  default: 0,      null: false
  end

  create_table "product_accessories", primary_key: "product_accessory_id", force: true do |t|
    t.integer "trigger_product_id",                     null: false
    t.integer "accessory_product_id",                   null: false
    t.integer "sort",                 default: 1000000
  end

  add_index "product_accessories", ["accessory_product_id"], name: "accessory_product_id", using: :btree
  add_index "product_accessories", ["trigger_product_id"], name: "trigger_product_id", using: :btree

  create_table "product_ad_campaigns", primary_key: "product_ad_campaign_id", force: true do |t|
    t.string  "name"
    t.integer "sort_order"
    t.text    "product_filter"
  end

  add_index "product_ad_campaigns", ["sort_order"], name: "index_product_ad_campaigns_on_sort_order", using: :btree

  create_table "product_ads", primary_key: "product_ad_id", force: true do |t|
    t.integer "product_ad_campaign_id"
    t.integer "ad_id"
    t.integer "sort_order"
  end

  add_index "product_ads", ["ad_id"], name: "index_product_ads_on_ad_id", using: :btree
  add_index "product_ads", ["product_ad_campaign_id"], name: "index_product_ads_on_product_ad_campaign_id", using: :btree
  add_index "product_ads", ["sort_order"], name: "index_product_ads_on_sort_order", using: :btree

  create_table "product_attribute_values", primary_key: "product_attribute_value_id", force: true do |t|
    t.integer "product_attribute_id"
    t.integer "attribute_value_id"
  end

  add_index "product_attribute_values", ["attribute_value_id"], name: "index_product_attribute_values_on_attribute_value_id", using: :btree
  add_index "product_attribute_values", ["product_attribute_id"], name: "index_product_attribute_values_on_product_attribute_id", using: :btree

  create_table "product_cross_sell", primary_key: "cross_sell_id", force: true do |t|
    t.integer "trigger_product_id", null: false
    t.integer "target_product_id",  null: false
  end

  add_index "product_cross_sell", ["target_product_id"], name: "target_product_id", using: :btree
  add_index "product_cross_sell", ["trigger_product_id"], name: "trigger_product_id", using: :btree

  create_table "product_image_thumbnails", force: true do |t|
    t.integer  "product_image_id"
    t.integer  "width"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_image_thumbnails", ["product_image_id", "width"], name: "index_product_image_thumbnails_on_product_image_id_and_width", unique: true, using: :btree
  add_index "product_image_thumbnails", ["product_image_id"], name: "index_product_image_thumbnails_on_product_image_id", using: :btree
  add_index "product_image_thumbnails", ["width"], name: "index_product_image_thumbnails_on_width", using: :btree

  create_table "product_images", primary_key: "image_id", force: true do |t|
    t.integer "product_id",             null: false
    t.string  "original",   limit: 128, null: false
    t.string  "large",      limit: 128
    t.string  "thumb",      limit: 128, null: false
    t.text    "alt"
  end

  add_index "product_images", ["product_id"], name: "product_id", using: :btree

  create_table "product_meta_tags", primary_key: "product_meta_id", force: true do |t|
    t.integer "meta_tag_id", null: false
    t.integer "product_id",  null: false
  end

  add_index "product_meta_tags", ["product_id"], name: "product_id", using: :btree

  create_table "product_obsolete_text", primary_key: "product_obsolete_text_id", force: true do |t|
    t.integer "product_id"
    t.text    "value"
  end

  add_index "product_obsolete_text", ["product_id"], name: "index_product_obsolete_text_on_product_id", unique: true, using: :btree

  create_table "product_price_dates", primary_key: "product_price_date_id", force: true do |t|
    t.string  "price_date"
    t.integer "product_id"
  end

  add_index "product_price_dates", ["price_date"], name: "index_product_price_dates_on_price_date", using: :btree
  add_index "product_price_dates", ["product_id"], name: "index_product_price_dates_on_product_id", using: :btree

  create_table "product_pricing", id: false, force: true do |t|
    t.integer "product_id", null: false
    t.float   "price"
  end

  create_table "product_pricing_sort", force: true do |t|
    t.integer "product_id"
    t.float   "sort_price"
  end

  add_index "product_pricing_sort", ["product_id"], name: "index_product_pricing_sort_on_product_id", unique: true, using: :btree
  add_index "product_pricing_sort", ["sort_price"], name: "index_product_pricing_sort_on_sort_price", using: :btree

  create_table "product_purchase_relations", primary_key: "product_purchase_relation_id", force: true do |t|
    t.integer "trigger_id"
    t.integer "other_id"
    t.integer "score"
  end

  add_index "product_purchase_relations", ["other_id"], name: "index_product_purchase_relations_on_other_id", using: :btree
  add_index "product_purchase_relations", ["score"], name: "index_product_purchase_relations_on_score", using: :btree
  add_index "product_purchase_relations", ["trigger_id"], name: "index_product_purchase_relations_on_trigger_id", using: :btree

  create_table "product_quantity_discounts", primary_key: "discount_id", force: true do |t|
    t.integer "product_id",                                             null: false
    t.integer "min_quantity",                                           null: false
    t.decimal "actual_price",   precision: 15, scale: 2,                null: false
    t.float   "markup",                                                 null: false
    t.boolean "quote_discount",                          default: true
  end

  add_index "product_quantity_discounts", ["product_id", "min_quantity"], name: "product_id_2", unique: true, using: :btree
  add_index "product_quantity_discounts", ["product_id"], name: "product_id", using: :btree

  create_table "product_reviews", primary_key: "review_id", force: true do |t|
    t.integer "product_id",                null: false
    t.integer "customer_id",               null: false
    t.boolean "rating",                    null: false
    t.boolean "status",                    null: false
    t.string  "reviewer_name", limit: 256, null: false
    t.text    "review",                    null: false
  end

  add_index "product_reviews", ["customer_id"], name: "customer_id", using: :btree
  add_index "product_reviews", ["product_id"], name: "product_id", using: :btree

  create_table "product_tabs", primary_key: "product_tab_id", force: true do |t|
    t.integer "product_id",               null: false
    t.string  "title",        limit: 128, null: false
    t.integer "sort_order",               null: false
    t.string  "type",         limit: 32,  null: false
    t.boolean "default_view",             null: false
    t.text    "data",                     null: false
  end

  add_index "product_tabs", ["product_id"], name: "product_id", using: :btree

  create_table "product_videos", primary_key: "product_video_id", force: true do |t|
    t.string  "youtube_code", limit: 15,                 null: false
    t.integer "product_id"
    t.boolean "visible",                 default: false
  end

  add_index "product_videos", ["product_id"], name: "index_product_videos_on_product_id", using: :btree
  add_index "product_videos", ["visible"], name: "index_product_videos_on_visible", using: :btree
  add_index "product_videos", ["youtube_code"], name: "index_product_videos_on_youtube_code", using: :btree

  create_table "product_warehouse", primary_key: "product_warehouse_id", force: true do |t|
    t.string  "stock_code",   limit: 128, null: false
    t.integer "on_hand",                  null: false
    t.integer "allocated",                null: false
    t.integer "available",                null: false
    t.integer "safety_stock",             null: false
    t.integer "on_order",                 null: false
    t.string  "default_bin",  limit: 6,   null: false
  end

  add_index "product_warehouse", ["stock_code"], name: "stock_code", using: :btree

  create_table "product_widgets", primary_key: "product_widget_id", force: true do |t|
    t.integer "product_id", null: false
    t.integer "widget_id",  null: false
    t.integer "sort_order", null: false
  end

  add_index "product_widgets", ["product_id"], name: "product_id", using: :btree

  create_table "products", primary_key: "product_id", force: true do |t|
    t.string  "legacy_id",               limit: 64,                                              null: false
    t.integer "shape_id"
    t.string  "catalog_code",            limit: 256,                                             null: false
    t.string  "name",                    limit: 256,                                             null: false
    t.text    "description",                                                                     null: false
    t.boolean "active",                                                                          null: false
    t.boolean "orderable",                                                                       null: false
    t.integer "quantity",                                                                        null: false
    t.float   "weight",                                                                          null: false
    t.boolean "is_new",                                                                          null: false
    t.boolean "on_sale",                                                                         null: false
    t.string  "clickserve_category",     limit: 256,                                             null: false
    t.decimal "base_price",                          precision: 14, scale: 2,                    null: false
    t.boolean "taxable",                                                                         null: false
    t.integer "default_image",                                                default: 0,        null: false
    t.decimal "cost",                                precision: 15, scale: 2,                    null: false
    t.string  "url",                     limit: 256,                                             null: false
    t.text    "notes",                                                                           null: false
    t.boolean "sales_only",                                                   default: false,    null: false
    t.integer "base_qty",                                                     default: 1,        null: false
    t.string  "unit_measure",            limit: 64,                           default: "each",   null: false
    t.float   "length",                                                       default: 0.0,      null: false
    t.float   "width",                                                        default: 0.0,      null: false
    t.float   "height",                                                       default: 0.0,      null: false
    t.float   "dunnage_override",                                             default: 0.0,      null: false
    t.boolean "freight_override",                                             default: false,    null: false
    t.float   "freight_override_value",                                       default: 0.0,      null: false
    t.string  "syspro_class",            limit: 16
    t.string  "title",                   limit: 256
    t.float   "fudge_factor",                                                 default: 0.0,      null: false
    t.string  "fudge_type",              limit: 8,                            default: "dollar", null: false
    t.text    "meta_keywords"
    t.text    "meta_description"
    t.string  "title_override",          limit: 256
    t.text    "low_inventory_message",                                                           null: false
    t.float   "freight_additional_cost",                                                         null: false
    t.string  "upc",                     limit: 45,                                              null: false
    t.string  "case_upc",                limit: 45,                                              null: false
    t.string  "short_name"
    t.string  "warehouse",               limit: 2,                            default: "0",      null: false
    t.string  "shorter_name",            limit: 60
    t.integer "noos",                    limit: 1,                                               null: false
    t.decimal "retail_price",                        precision: 15, scale: 4
    t.string  "heading"
    t.string  "subheading"
    t.integer "manufacturer_id"
    t.string  "part_no"
    t.integer "case_qty"
    t.integer "desc_attr_toggle",                                             default: 0
    t.boolean "dropship",                                                     default: false
    t.boolean "obsolete",                                                     default: false
    t.string  "cons_catalog_code"
    t.integer "cons_warehouse_num"
    t.integer "free_ground_shipping",                                         default: 0
    t.integer "featured_video_image"
  end

  add_index "products", ["catalog_code"], name: "catalog_code", using: :btree
  add_index "products", ["cons_catalog_code"], name: "index_products_on_cons_catalog_code", using: :btree
  add_index "products", ["cons_warehouse_num"], name: "index_products_on_cons_warehouse_num", using: :btree
  add_index "products", ["description"], name: "description", type: :fulltext
  add_index "products", ["dropship"], name: "index_products_on_dropship", using: :btree
  add_index "products", ["featured_video_image"], name: "index_products_on_featured_video_image", using: :btree
  add_index "products", ["free_ground_shipping"], name: "index_products_on_free_ground_shipping", using: :btree
  add_index "products", ["legacy_id"], name: "legacy_id", using: :btree
  add_index "products", ["manufacturer_id"], name: "index_products_on_manufacturer_id", using: :btree
  add_index "products", ["name", "description"], name: "name_2", type: :fulltext
  add_index "products", ["name"], name: "name", type: :fulltext
  add_index "products", ["obsolete"], name: "index_products_on_obsolete", using: :btree
  add_index "products", ["shape_id"], name: "shape_id", using: :btree

  create_table "products_attributes", primary_key: "product_attribute_id", force: true do |t|
    t.integer "product_id",                     null: false
    t.integer "attribute_id",                   null: false
    t.boolean "visible",        default: false, null: false
    t.boolean "detail_visible", default: true,  null: false
  end

  add_index "products_attributes", ["attribute_id"], name: "attribute_id", using: :btree
  add_index "products_attributes", ["product_id", "attribute_id"], name: "product_id", unique: true, using: :btree
  add_index "products_attributes", ["product_id"], name: "product_id_2", using: :btree

  create_table "products_backorder_status", primary_key: "products_backorder_status_id", force: true do |t|
    t.integer  "product_id"
    t.datetime "last_checked"
    t.boolean  "backordered",          default: false
    t.integer  "quantity_backordered"
    t.datetime "order_date"
  end

  add_index "products_backorder_status", ["last_checked"], name: "index_products_backorder_status_on_last_checked", using: :btree
  add_index "products_backorder_status", ["product_id", "last_checked"], name: "index_products_backorder_status_on_product_id_and_last_checked", using: :btree
  add_index "products_backorder_status", ["product_id"], name: "index_products_backorder_status_on_product_id", unique: true, using: :btree

  create_table "products_categories", primary_key: "product_category_id", force: true do |t|
    t.integer "product_id",  null: false
    t.integer "category_id", null: false
  end

  add_index "products_categories", ["category_id"], name: "category_id", using: :btree
  add_index "products_categories", ["product_id"], name: "product_id", using: :btree

  create_table "promotion_codes", primary_key: "promotion_code_id", force: true do |t|
    t.integer "promotion_id"
    t.string  "code"
    t.integer "use_limit",    default: 0
  end

  add_index "promotion_codes", ["code"], name: "index_promotion_codes_on_code", unique: true, using: :btree
  add_index "promotion_codes", ["promotion_id"], name: "index_promotion_codes_on_promotion_id", using: :btree

  create_table "promotions", primary_key: "promotion_id", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.float   "discount_percent"
    t.text    "product_filter"
    t.date    "expiration_date"
    t.float   "minimum_order_requirement",                          default: 0.0
    t.boolean "visible",                                            default: true
    t.string  "bonus_catalog_code"
    t.decimal "bonus_product_price",       precision: 15, scale: 2
    t.string  "bonus_product_message"
    t.boolean "email_signup",                                       default: false, null: false
    t.text    "product_exclusion_filter"
  end

  add_index "promotions", ["expiration_date"], name: "index_promotions_on_Expiration_date", using: :btree
  add_index "promotions", ["visible"], name: "index_promotions_on_visible", using: :btree

  create_table "quote_messages", primary_key: "quote_message_id", force: true do |t|
    t.integer   "quote_id",     null: false
    t.integer   "sales_rep_id", null: false
    t.timestamp "timestamp",    null: false
    t.text      "message"
  end

  add_index "quote_messages", ["quote_id"], name: "quote_id", using: :btree
  add_index "quote_messages", ["sales_rep_id"], name: "sales_rep_id", using: :btree
  add_index "quote_messages", ["timestamp"], name: "timestamp", using: :btree

  create_table "sales_quote_products", primary_key: "sales_quote_product_id", force: true do |t|
    t.integer "sales_quote_id",                            null: false
    t.integer "product_id",                                null: false
    t.integer "quantity",                                  null: false
    t.decimal "discounted_price", precision: 15, scale: 2, null: false
  end

  add_index "sales_quote_products", ["sales_quote_id", "product_id"], name: "sales_quote_id2", unique: true, using: :btree
  add_index "sales_quote_products", ["sales_quote_id"], name: "sales_quote_id", using: :btree

  create_table "sales_quotes", primary_key: "sales_quote_id", force: true do |t|
    t.integer   "customer_id",             null: false
    t.integer   "sales_rep_id",            null: false
    t.timestamp "expires",                 null: false
    t.string    "type",         limit: 16, null: false
    t.string    "status",       limit: 16, null: false
  end

  add_index "sales_quotes", ["customer_id"], name: "customer_id", using: :btree
  add_index "sales_quotes", ["sales_rep_id"], name: "sales_rep_id", using: :btree

  create_table "sales_rep_goals", primary_key: "sales_rep_goal_id", force: true do |t|
    t.integer "sales_rep_id", null: false
    t.integer "month",        null: false
    t.integer "year",         null: false
    t.integer "monthly_goal", null: false
    t.integer "working_days", null: false
  end

  create_table "sales_rep_products", primary_key: "sales_rep_product_id", force: true do |t|
    t.integer "sales_rep_id", null: false
    t.integer "product_id",   null: false
    t.integer "quantity",     null: false
  end

  add_index "sales_rep_products", ["sales_rep_id", "product_id"], name: "sales_rep_id_2", unique: true, using: :btree
  add_index "sales_rep_products", ["sales_rep_id"], name: "sales_rep_id", using: :btree

  create_table "sales_reps", primary_key: "sales_rep_id", force: true do |t|
    t.string  "name",                 limit: 256,                                          null: false
    t.string  "phone",                limit: 40,                                           null: false
    t.string  "fax",                  limit: 40,                                           null: false
    t.string  "email",                limit: 256,                                          null: false
    t.string  "password",             limit: 40,                                           null: false
    t.string  "salt",                 limit: 40,                                           null: false
    t.string  "status",               limit: 12,                                           null: false
    t.boolean "cancel_permission",                                         default: false, null: false
    t.boolean "change_permission",                                         default: false, null: false
    t.boolean "manager",                                                   default: false, null: false
    t.integer "manager_id",                                                default: 0,     null: false
    t.string  "max_payment_term",     limit: 2
    t.string  "syspro_id",            limit: 8,                                            null: false
    t.float   "margin_cap",                                                default: 1.0,   null: false
    t.float   "max_discount",                                              default: 0.0,   null: false
    t.float   "max_expiration",                                            default: 30.0,  null: false
    t.decimal "max_quote_value",                  precision: 15, scale: 2, default: 0.0,   null: false
    t.boolean "receive_confirmation",                                      default: true,  null: false
    t.boolean "requires_approval",                                         default: true,  null: false
    t.boolean "commissioned",                                              default: false, null: false
    t.string  "ext",                  limit: 3
    t.integer "permission_level",                                          default: 0
  end

  create_table "saved_checkouts", primary_key: "checkout_id", force: true do |t|
    t.integer   "sales_rep_id",                                        null: false
    t.integer   "customer_id",                                         null: false
    t.timestamp "timestamp",                                           null: false
    t.text      "checkout"
    t.decimal   "total",        precision: 15, scale: 2, default: 0.0
  end

  add_index "saved_checkouts", ["sales_rep_id"], name: "sales_rep", using: :btree

  create_table "schema_changes", primary_key: "change_id", force: true do |t|
    t.string    "script_name", limit: 50, null: false
    t.timestamp "date_added",             null: false
  end

  add_index "schema_changes", ["script_name"], name: "script_name", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "session_id", limit: 64
    t.text     "data",       limit: 2147483647, null: false
    t.datetime "updated",                       null: false
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated"], name: "index_sessions_on_updated", using: :btree

  create_table "ship_via_options", primary_key: "ship_via_option_id", force: true do |t|
    t.string "option_name",   limit: 64, null: false
    t.string "syspro_option", limit: 16, null: false
  end

  create_table "shipping_carriers", primary_key: "shipping_carrier_id", force: true do |t|
    t.string "shipper_name", limit: 64
    t.string "shipper_key",  limit: 32
  end

  create_table "shipping_methods", primary_key: "shipping_method_id", force: true do |t|
    t.integer "shipping_carrier_id", null: false
    t.string  "method_name"
    t.string  "method_description"
    t.string  "method_key"
    t.integer "syspro_id"
  end

  create_table "shipping_zips_to_zones", primary_key: "zone_id", force: true do |t|
    t.integer "shipping_carrier_id"
    t.integer "shipper_method_id"
    t.string  "zip_ref",             limit: 3
    t.integer "zone"
  end

  create_table "shipping_zone_rates", primary_key: "rate_id", force: true do |t|
    t.integer "weight"
    t.integer "shipper_method"
    t.integer "zone"
    t.decimal "amount",         precision: 10, scale: 2, default: 0.0, null: false
  end

  create_table "states", primary_key: "state_id", force: true do |t|
    t.string  "state",     limit: 32,                                       null: false
    t.string  "abbr",      limit: 8
    t.decimal "sales_tax",            precision: 6, scale: 4, default: 0.0, null: false
  end

  add_index "states", ["abbr"], name: "index_states_on_abbr", using: :btree

  create_table "stop_words", primary_key: "word_id", force: true do |t|
    t.string "word", limit: 128, null: false
  end

  create_table "top_nav", primary_key: "top_nav_id", force: true do |t|
    t.string "path", null: false
    t.string "name", null: false
    t.string "href", null: false
  end

  create_table "top_sellers", primary_key: "top_seller_id", force: true do |t|
    t.integer "product_id"
    t.integer "score"
  end

  add_index "top_sellers", ["product_id"], name: "index_top_sellers_on_product_id", using: :btree
  add_index "top_sellers", ["score"], name: "index_top_sellers_on_score", using: :btree

  create_table "units", primary_key: "unit_id", force: true do |t|
    t.string "name"
    t.string "short_name"
    t.string "format"
    t.string "short_format"
  end

  create_table "user_password_tokens", primary_key: "token_id", force: true do |t|
    t.integer   "user_id",               null: false
    t.string    "user_type",  limit: 32, null: false
    t.string    "token",      limit: 16, null: false
    t.timestamp "expiration",            null: false
  end

  add_index "user_password_tokens", ["token"], name: "token", unique: true, using: :btree
  add_index "user_password_tokens", ["user_id", "user_type"], name: "user_id", using: :btree

  create_table "user_sessions", primary_key: "user_session_id", force: true do |t|
    t.integer "user_id",              null: false
    t.string  "user_type", limit: 64, null: false
    t.string  "token",     limit: 40, null: false
  end

  add_index "user_sessions", ["token"], name: "token", unique: true, using: :btree
  add_index "user_sessions", ["user_id", "user_type"], name: "user_id", using: :btree

  create_table "utility_mod_programs", primary_key: "utility_mod_program_id", force: true do |t|
    t.string "sponsor",      limit: 64,  null: false
    t.string "program_code", limit: 16,  null: false
    t.string "savings_text", limit: 64,  null: false
    t.text   "description"
    t.string "products",     limit: 128, null: false
    t.date   "start_date"
    t.date   "end_date"
  end

  add_index "utility_mod_programs", ["program_code"], name: "program_code", unique: true, using: :btree

  create_table "utility_mods", primary_key: "utility_mod_id", force: true do |t|
    t.string "program_id", limit: 16,  null: false
    t.string "zip_code",   limit: 5,   null: false
    t.string "stock_code", limit: 256, null: false
    t.string "mod_type",   limit: 2,   null: false
    t.float  "price",                  null: false
  end

  add_index "utility_mods", ["stock_code"], name: "stock_code", using: :btree
  add_index "utility_mods", ["zip_code", "program_id", "stock_code"], name: "zip_stock_program", unique: true, using: :btree
  add_index "utility_mods", ["zip_code", "stock_code"], name: "zip_stock", unique: true, using: :btree
  add_index "utility_mods", ["zip_code"], name: "zip_code", using: :btree

  create_table "widget_configuration", primary_key: "widget_configuration_id", force: true do |t|
    t.integer "widget_id",                null: false
    t.string  "config_key",   limit: 128, null: false
    t.text    "config_value",             null: false
  end

  add_index "widget_configuration", ["widget_id"], name: "widget_id", using: :btree

  create_table "widgets", primary_key: "widget_id", force: true do |t|
    t.string "nickname",     limit: 128, null: false
    t.string "widget_class", limit: 128, null: false
  end

  create_table "wishlist_products", primary_key: "wishlist_product_id", force: true do |t|
    t.integer "wishlist_id", null: false
    t.integer "product_id",  null: false
    t.integer "quantity",    null: false
    t.text    "notes",       null: false
  end

  add_index "wishlist_products", ["wishlist_id"], name: "wishlist_id", using: :btree

  create_table "wishlists", primary_key: "wishlist_id", force: true do |t|
    t.integer "customer_id",             null: false
    t.string  "name",        limit: 256, null: false
    t.text    "notes",                   null: false
  end

  add_index "wishlists", ["customer_id"], name: "customer_id", using: :btree
  add_index "wishlists", ["name", "notes"], name: "Wishlist_Search", type: :fulltext

end
