require "administrate/base_dashboard"

class CategoryDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    images: Field::HasMany,
    items: Field::HasMany,
    organization: Field::BelongsTo,
    primary_image: Field::BelongsTo.with_options(class_name: "Image"),
    id: Field::Number,
    primary_image_id: Field::Number,
    key: Field::String,
    position: Field::Number,
    status: Field::String.with_options(searchable: false),
    name: Field::String,
    short_description: Field::String,
    long_description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :short_description,
    :items
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :images,
    :items,
    :organization,
    :primary_image,
    :id,
    :primary_image_id,
    :key,
    :position,
    :status,
    :name,
    :short_description,
    :long_description,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :images,
    :items,
    :organization,
    :primary_image,
    :primary_image_id,
    :key,
    :position,
    :status,
    :name,
    :short_description,
    :long_description,
  ].freeze

  def display_resource(category)
    "Category: #{category.name}"
  end
end
