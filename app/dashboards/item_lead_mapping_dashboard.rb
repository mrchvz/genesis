require "administrate/base_dashboard"

class ItemLeadMappingDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    item: Field::BelongsTo,
    lead: Field::BelongsTo,
    organization: Field::BelongsTo,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :item,
    :lead
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :item,
    :lead,
    :organization,
    :id,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :item,
    :lead,
    :organization,
  ].freeze

  # def display_resource(item_lead_mapping)
  #   "ItemLeadMapping ##{item_lead_mapping.id}"
  # end
end
