require "administrate/base_dashboard"

class LeadDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    item_lead_mappings: Field::HasMany,
    organization: Field::BelongsTo,
    person: Field::BelongsTo,
    id: Field::Number,
    status: Field::String.with_options(searchable: false),
    message: Field::Text,
    desired_date: Field::DateTime,
    desired_time_range: Field::String.with_options(searchable: false),
    preferred_conversation_channel: Field::String.with_options(searchable: false),
    source: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :person,
    :item_lead_mappings,
    :status,
    :desired_date,
    :desired_time_range,
    :created_at,
    :updated_at
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :item_lead_mappings,
    :organization,
    :person,
    :id,
    :status,
    :message,
    :desired_date,
    :desired_time_range,
    :preferred_conversation_channel,
    :source,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :item_lead_mappings,
    :organization,
    :person,
    :status,
    :message,
    :desired_date,
    :desired_time_range,
    :preferred_conversation_channel,
    :source,
  ].freeze

  # def display_resource(lead)
  #   "Lead ##{lead.id}"
  # end
end
