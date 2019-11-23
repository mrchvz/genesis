require "administrate/base_dashboard"

class TestimonialDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    images: Field::HasMany,
    item_testimonial_mappings: Field::HasMany,
    after_image: Field::BelongsTo.with_options(class_name: "Image"),
    before_image: Field::BelongsTo.with_options(class_name: "Image"),
    organization: Field::BelongsTo,
    person: Field::BelongsTo,
    id: Field::Number,
    after_image_id: Field::Number,
    before_image_id: Field::Number,
    date: Field::DateTime,
    long_text: Field::Text,
    rating: Field::Number,
    short_text: Field::String,
    status: Field::String.with_options(searchable: false),
    source: Field::String.with_options(searchable: false),
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :person,
    :item_testimonial_mappings,
    :created_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :images,
    :item_testimonial_mappings,
    :after_image,
    :before_image,
    :organization,
    :person,
    :id,
    :after_image_id,
    :before_image_id,
    :date,
    :long_text,
    :rating,
    :short_text,
    :status,
    :source,
    :url,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :images,
    :item_testimonial_mappings,
    :after_image,
    :before_image,
    :organization,
    :person,
    :after_image_id,
    :before_image_id,
    :date,
    :long_text,
    :rating,
    :short_text,
    :status,
    :source,
    :url,
  ].freeze

  # def display_resource(testimonial)
  #   "Testimonial ##{testimonial.id}"
  # end
end
