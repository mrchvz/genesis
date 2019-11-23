require "administrate/base_dashboard"

class AttachmentDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    attachable: Field::Polymorphic,
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
    :attachable,
    :title,
    :description,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :attachable,
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
    :attachable,
    :organization,
    :position,
    :title,
    :description,
    :payload,
  ].freeze

  def display_resource(attachment)
    "Attachment ##{attachment.title}"
  end
end
