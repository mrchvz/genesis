require "administrate/base_dashboard"

class ItemDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    attachments: Field::HasMany,
    images: Field::HasMany,
    item_lead_mappings: Field::HasMany,
    item_testimonial_mappings: Field::HasMany,
    category: Field::BelongsTo,
    organization: Field::BelongsTo,
    primary_attachment: Field::BelongsTo.with_options(class_name: "Attachment"),
    primary_image: Field::BelongsTo.with_options(class_name: "Image"),
    id: Field::Number,
    primary_attachment_id: Field::Number,
    primary_image_id: Field::Number,
    external_price_in_cents: Field::Number,
    form: Field::String.with_options(searchable: false),
    internal_price_in_cents: Field::Number,
    key: Field::String,
    name: Field::String,
    long_description: Field::Text,
    position: Field::Number,
    primary_kind: Field::String.with_options(searchable: false),
    short_description: Field::String,
    status: Field::String.with_options(searchable: false),
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :form,
    :category,
    :name,
    :short_description
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :attachments,
    :images,
    :item_lead_mappings,
    :item_testimonial_mappings,
    :category,
    :organization,
    :primary_attachment,
    :primary_image,
    :id,
    :primary_attachment_id,
    :primary_image_id,
    :external_price_in_cents,
    :form,
    :internal_price_in_cents,
    :key,
    :name,
    :long_description,
    :position,
    :primary_kind,
    :short_description,
    :status,
    :url,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :attachments,
    :images,
    :item_lead_mappings,
    :item_testimonial_mappings,
    :category,
    :organization,
    :primary_attachment,
    :primary_image,
    :primary_attachment_id,
    :primary_image_id,
    :external_price_in_cents,
    :form,
    :internal_price_in_cents,
    :key,
    :name,
    :long_description,
    :position,
    :primary_kind,
    :short_description,
    :status,
    :url,
  ].freeze

  def display_resource(item)
    "Item: #{item.name}"
  end
end
