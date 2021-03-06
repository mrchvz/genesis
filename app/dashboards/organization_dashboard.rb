require "administrate/base_dashboard"

class OrganizationDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    addressable_addresses: Field::HasMany.with_options(class_name: "Address"),
    addresses: Field::HasMany,
    attachable_attachments: Field::HasMany.with_options(class_name: "Attachment"),
    attachments: Field::HasMany,
    authentications: Field::HasMany,
    categories: Field::HasMany,
    emailable_emails: Field::HasMany.with_options(class_name: "Email"),
    emails: Field::HasMany,
    imageable_images: Field::HasMany.with_options(class_name: "Image"),
    images: Field::HasMany,
    items: Field::HasMany,
    item_lead_mappings: Field::HasMany,
    item_testimonial_mappings: Field::HasMany,
    leads: Field::HasMany,
    people: Field::HasMany,
    phoneable_phones: Field::HasMany.with_options(class_name: "Phone"),
    phones: Field::HasMany,
    social_proofs: Field::HasMany,
    testimonial: Field::HasMany,
    primary_address: Field::BelongsTo.with_options(class_name: "Address"),
    primary_email: Field::BelongsTo.with_options(class_name: "Email"),
    primary_image: Field::BelongsTo.with_options(class_name: "Image"),
    primary_phone: Field::BelongsTo.with_options(class_name: "Phone"),
    id: Field::Number,
    name: Field::String,
    subdomain: Field::String,
    status: Field::String.with_options(searchable: false),
    url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    primary_address_id: Field::Number,
    primary_phone_id: Field::Number,
    primary_image_id: Field::Number,
    primary_email_id: Field::Number,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :subdomain,
    :status,
    :people,
    :categories,
    :items,
    :leads,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :addressable_addresses,
    :addresses,
    :attachable_attachments,
    :attachments,
    :authentications,
    :categories,
    :emailable_emails,
    :emails,
    :imageable_images,
    :images,
    :items,
    :item_lead_mappings,
    :item_testimonial_mappings,
    :leads,
    :people,
    :phoneable_phones,
    :phones,
    :social_proofs,
    :testimonial,
    :primary_address,
    :primary_email,
    :primary_image,
    :primary_phone,
    :id,
    :name,
    :subdomain,
    :status,
    :url,
    :created_at,
    :updated_at,
    :primary_address_id,
    :primary_phone_id,
    :primary_image_id,
    :primary_email_id,
  ].freeze

  FORM_ATTRIBUTES = [
    :addressable_addresses,
    :addresses,
    :attachable_attachments,
    :attachments,
    :authentications,
    :categories,
    :emailable_emails,
    :emails,
    :imageable_images,
    :images,
    :items,
    :item_lead_mappings,
    :item_testimonial_mappings,
    :leads,
    :people,
    :phoneable_phones,
    :phones,
    :social_proofs,
    :testimonial,
    :primary_address,
    :primary_email,
    :primary_image,
    :primary_phone,
    :name,
    :subdomain,
    :status,
    :url,
    :primary_address_id,
    :primary_phone_id,
    :primary_image_id,
    :primary_email_id,
  ].freeze

  def display_resource(organization)
    "Organization: #{organization.name}"
  end
end
