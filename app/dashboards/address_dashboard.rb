require "administrate/base_dashboard"

class AddressDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    addressable: Field::Polymorphic,
    organization: Field::BelongsTo,
    id: Field::Number,
    position: Field::Number,
    label: Field::String,
    line_1: Field::String,
    line_2: Field::String,
    line_3: Field::String,
    city: Field::String,
    zip_postal_code: Field::String,
    state_province_county: Field::String,
    country_code: Field::String.with_options(searchable: false),
    confirmed: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :addressable,
    :country_code,
    :state_province_county,
    :line_1,
    :line_2,
    :line_3,
    :confirmed
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :addressable,
    :organization,
    :id,
    :position,
    :label,
    :line_1,
    :line_2,
    :line_3,
    :city,
    :zip_postal_code,
    :state_province_county,
    :country_code,
    :confirmed,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :addressable,
    :organization,
    :position,
    :label,
    :line_1,
    :line_2,
    :line_3,
    :city,
    :zip_postal_code,
    :state_province_county,
    :country_code,
    :confirmed,
  ].freeze

  def display_resource(address)
    "Address: #{address.calculated_full_address}"
  end
end
