require "administrate/base_dashboard"

class ImageDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    imageable: Field::Polymorphic,
    organization: Field::BelongsTo,
    id: Field::Number,
    position: Field::Number,
    title: Field::String,
    description: Field::Text,
    payload: Field::Carrierwave,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :imageable,
    :title,
    :description
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :imageable,
    :organization,
    :id,
    :position,
    :title,
    :description,
    :payload,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :imageable,
    :organization,
    :position,
    :title,
    :description,
    :payload,
  ].freeze

  def display_resource(image)
    "Image ##{image.title}"
  end
end
