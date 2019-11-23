require "administrate/base_dashboard"

class SocialProofDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    images: Field::HasMany,
    organization: Field::BelongsTo,
    primary_image: Field::BelongsTo.with_options(class_name: "Image"),
    id: Field::Number,
    primary_image_id: Field::Number,
    position: Field::Number,
    title: Field::String,
    description: Field::Text,
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :primary_image,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :images,
    :organization,
    :primary_image,
    :id,
    :primary_image_id,
    :position,
    :title,
    :description,
    :url,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :images,
    :organization,
    :primary_image,
    :primary_image_id,
    :position,
    :title,
    :description,
    :url,
  ].freeze

  def display_resource(social_proof)
    "SocialProof ##{social_proof.title}"
  end
end
