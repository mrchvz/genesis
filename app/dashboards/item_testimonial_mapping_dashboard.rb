require "administrate/base_dashboard"

class ItemTestimonialMappingDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    item: Field::BelongsTo,
    organization: Field::BelongsTo,
    testimonial: Field::BelongsTo,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :item,
    :testimonial,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :item,
    :organization,
    :testimonial,
    :id,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :item,
    :organization,
    :testimonial,
  ].freeze

  # def display_resource(item_testimonial_mapping)
  #   "ItemTestimonialMapping ##{item_testimonial_mapping.id}"
  # end
end
