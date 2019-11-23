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

ActiveRecord::Schema.define(version: 2019_02_17_001608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.bigint "organization_id"
    t.integer "position"
    t.string "label"
    t.string "line_1"
    t.string "line_2"
    t.string "line_3"
    t.string "city"
    t.string "zip_postal_code"
    t.string "state_province_county"
    t.integer "country_code"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
    t.index ["organization_id"], name: "index_addresses_on_organization_id"
  end

  create_table "attachments", force: :cascade do |t|
    t.string "attachable_type"
    t.bigint "attachable_id"
    t.bigint "organization_id"
    t.integer "position"
    t.string "title"
    t.text "description"
    t.string "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id"
    t.index ["organization_id"], name: "index_attachments_on_organization_id"
  end

  create_table "authentications", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "person_id"
    t.inet "ip"
    t.string "token"
    t.text "user_agent"
    t.string "uuid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_authentications_on_organization_id"
    t.index ["person_id"], name: "index_authentications_on_person_id"
    t.index ["token"], name: "index_authentications_on_token"
    t.index ["uuid"], name: "index_authentications_on_uuid"
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "primary_image_id"
    t.string "key"
    t.integer "position"
    t.integer "status"
    t.string "name"
    t.string "short_description"
    t.text "long_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_categories_on_key"
    t.index ["organization_id"], name: "index_categories_on_organization_id"
    t.index ["primary_image_id"], name: "index_categories_on_primary_image_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "emailable_type"
    t.bigint "emailable_id"
    t.bigint "organization_id"
    t.integer "position"
    t.string "address"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emailable_type", "emailable_id"], name: "index_emails_on_emailable_type_and_emailable_id"
    t.index ["organization_id"], name: "index_emails_on_organization_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.bigint "organization_id"
    t.integer "position"
    t.string "title"
    t.text "description"
    t.string "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
    t.index ["organization_id"], name: "index_images_on_organization_id"
  end

  create_table "item_lead_mappings", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "item_id"
    t.bigint "lead_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_lead_mappings_on_item_id"
    t.index ["lead_id"], name: "index_item_lead_mappings_on_lead_id"
    t.index ["organization_id"], name: "index_item_lead_mappings_on_organization_id"
  end

  create_table "item_testimonial_mappings", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "item_id"
    t.bigint "testimonial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_testimonial_mappings_on_item_id"
    t.index ["organization_id"], name: "index_item_testimonial_mappings_on_organization_id"
    t.index ["testimonial_id"], name: "index_item_testimonial_mappings_on_testimonial_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "primary_attachment_id"
    t.bigint "primary_image_id"
    t.bigint "organization_id"
    t.integer "external_price_in_cents", default: 0
    t.integer "form"
    t.integer "internal_price_in_cents", default: 0
    t.string "key"
    t.string "name"
    t.text "long_description"
    t.integer "position"
    t.integer "primary_kind"
    t.string "short_description"
    t.integer "status"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["key"], name: "index_items_on_key"
    t.index ["organization_id"], name: "index_items_on_organization_id"
    t.index ["primary_attachment_id"], name: "index_items_on_primary_attachment_id"
    t.index ["primary_image_id"], name: "index_items_on_primary_image_id"
  end

  create_table "leads", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "person_id"
    t.integer "status"
    t.text "message"
    t.date "desired_date"
    t.integer "desired_time_range"
    t.integer "preferred_conversation_channel"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_leads_on_organization_id"
    t.index ["person_id"], name: "index_leads_on_person_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.integer "status"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "primary_address_id"
    t.bigint "primary_phone_id"
    t.bigint "primary_image_id"
    t.bigint "primary_email_id"
    t.index ["name"], name: "index_organizations_on_name"
    t.index ["primary_address_id"], name: "index_organizations_on_primary_address_id"
    t.index ["primary_email_id"], name: "index_organizations_on_primary_email_id"
    t.index ["primary_image_id"], name: "index_organizations_on_primary_image_id"
    t.index ["primary_phone_id"], name: "index_organizations_on_primary_phone_id"
    t.index ["status"], name: "index_organizations_on_status"
    t.index ["subdomain"], name: "index_organizations_on_subdomain"
  end

  create_table "people", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "primary_address_id"
    t.bigint "primary_email_id"
    t.bigint "primary_image_id"
    t.bigint "primary_phone_id"
    t.text "biography"
    t.date "date_of_birth"
    t.string "name"
    t.integer "primary_kind"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_people_on_organization_id"
    t.index ["primary_address_id"], name: "index_people_on_primary_address_id"
    t.index ["primary_email_id"], name: "index_people_on_primary_email_id"
    t.index ["primary_image_id"], name: "index_people_on_primary_image_id"
    t.index ["primary_phone_id"], name: "index_people_on_primary_phone_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string "phoneable_type"
    t.bigint "phoneable_id"
    t.bigint "organization_id"
    t.integer "position"
    t.string "label"
    t.integer "country_code"
    t.string "number"
    t.string "extension"
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_phones_on_organization_id"
    t.index ["phoneable_type", "phoneable_id"], name: "index_phones_on_phoneable_type_and_phoneable_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "organization_id"
    t.bigint "primary_image_id"
    t.integer "status"
    t.string "title"
    t.text "content"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_posts_on_author_id"
    t.index ["organization_id"], name: "index_posts_on_organization_id"
    t.index ["primary_image_id"], name: "index_posts_on_primary_image_id"
  end

  create_table "social_proofs", force: :cascade do |t|
    t.bigint "organization_id"
    t.bigint "primary_image_id"
    t.integer "position"
    t.string "title"
    t.text "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_social_proofs_on_organization_id"
    t.index ["primary_image_id"], name: "index_social_proofs_on_primary_image_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.bigint "after_image_id"
    t.bigint "before_image_id"
    t.bigint "organization_id"
    t.bigint "person_id"
    t.date "date"
    t.text "long_text"
    t.integer "rating"
    t.string "short_text"
    t.integer "status"
    t.integer "source"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["after_image_id"], name: "index_testimonials_on_after_image_id"
    t.index ["before_image_id"], name: "index_testimonials_on_before_image_id"
    t.index ["organization_id"], name: "index_testimonials_on_organization_id"
    t.index ["person_id"], name: "index_testimonials_on_person_id"
  end

  add_foreign_key "addresses", "organizations"
  add_foreign_key "attachments", "organizations"
  add_foreign_key "authentications", "organizations"
  add_foreign_key "authentications", "people"
  add_foreign_key "categories", "images", column: "primary_image_id"
  add_foreign_key "categories", "organizations"
  add_foreign_key "emails", "organizations"
  add_foreign_key "images", "organizations"
  add_foreign_key "item_lead_mappings", "items"
  add_foreign_key "item_lead_mappings", "leads"
  add_foreign_key "item_lead_mappings", "organizations"
  add_foreign_key "item_testimonial_mappings", "items"
  add_foreign_key "item_testimonial_mappings", "organizations"
  add_foreign_key "item_testimonial_mappings", "testimonials"
  add_foreign_key "items", "attachments", column: "primary_attachment_id"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "images", column: "primary_image_id"
  add_foreign_key "items", "organizations"
  add_foreign_key "leads", "organizations"
  add_foreign_key "leads", "people"
  add_foreign_key "organizations", "addresses", column: "primary_address_id"
  add_foreign_key "organizations", "emails", column: "primary_email_id"
  add_foreign_key "organizations", "images", column: "primary_image_id"
  add_foreign_key "organizations", "phones", column: "primary_phone_id"
  add_foreign_key "people", "addresses", column: "primary_address_id"
  add_foreign_key "people", "emails", column: "primary_email_id"
  add_foreign_key "people", "images", column: "primary_image_id"
  add_foreign_key "people", "organizations"
  add_foreign_key "people", "phones", column: "primary_phone_id"
  add_foreign_key "phones", "organizations"
  add_foreign_key "posts", "images", column: "primary_image_id"
  add_foreign_key "posts", "organizations"
  add_foreign_key "posts", "people", column: "author_id"
  add_foreign_key "social_proofs", "images", column: "primary_image_id"
  add_foreign_key "social_proofs", "organizations"
  add_foreign_key "testimonials", "images", column: "after_image_id"
  add_foreign_key "testimonials", "images", column: "before_image_id"
  add_foreign_key "testimonials", "organizations"
  add_foreign_key "testimonials", "people"
end
