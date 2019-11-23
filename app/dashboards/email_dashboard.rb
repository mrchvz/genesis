require "administrate/base_dashboard"

class EmailDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    emailable: Field::Polymorphic,
    organization: Field::BelongsTo,
    id: Field::Number,
    position: Field::Number,
    address: Field::String,
    confirmed: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :emailable,
    :address,
    :confirmed
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :emailable,
    :organization,
    :id,
    :position,
    :address,
    :confirmed,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :emailable,
    :organization,
    :position,
    :address,
    :confirmed,
  ].freeze

  def display_resource(email)
    "Email: #{email.address}"
  end
end
