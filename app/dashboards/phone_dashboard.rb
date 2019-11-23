require "administrate/base_dashboard"

class PhoneDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    phoneable: Field::Polymorphic,
    organization: Field::BelongsTo,
    id: Field::Number,
    position: Field::Number,
    label: Field::String,
    country_code: Field::String.with_options(searchable: false),
    number: Field::String,
    extension: Field::String,
    confirmed: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :phoneable,
    :country_code,
    :number,
    :extension
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :phoneable,
    :organization,
    :id,
    :position,
    :label,
    :country_code,
    :number,
    :extension,
    :confirmed,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :phoneable,
    :organization,
    :position,
    :label,
    :country_code,
    :number,
    :extension,
    :confirmed,
  ].freeze

  def display_resource(phone)
    "Phone: #{phone.calculated_full_number}"
  end
end
