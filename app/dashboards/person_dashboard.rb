require "administrate/base_dashboard"

class PersonDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    addresses: Field::HasMany,
    authentications: Field::HasMany,
    emails: Field::HasMany,
    images: Field::HasMany,
    phones: Field::HasMany,
    organization: Field::BelongsTo,
    primary_address: Field::BelongsTo.with_options(class_name: "Address"),
    primary_email: Field::BelongsTo.with_options(class_name: "Email"),
    primary_image: Field::BelongsTo.with_options(class_name: "Image"),
    primary_phone: Field::BelongsTo.with_options(class_name: "Phone"),
    id: Field::Number,
    primary_address_id: Field::Number,
    primary_email_id: Field::Number,
    primary_image_id: Field::Number,
    primary_phone_id: Field::Number,
    biography: Field::String,
    date_of_birth: Field::DateTime,
    name: Field::String,
    primary_kind: Field::String.with_options(searchable: false),
    status: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :primary_kind,
    :name,
    :primary_email,
    :primary_phone
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :addresses,
    :authentications,
    :emails,
    :images,
    :phones,
    :organization,
    :primary_address,
    :primary_email,
    :primary_image,
    :primary_phone,
    :id,
    :primary_address_id,
    :primary_email_id,
    :primary_image_id,
    :primary_phone_id,
    :biography,
    :date_of_birth,
    :name,
    :primary_kind,
    :status,
    :created_at,
    :updated_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :addresses,
    :authentications,
    :emails,
    :images,
    :phones,
    :organization,
    :primary_address,
    :primary_email,
    :primary_image,
    :primary_phone,
    :primary_address_id,
    :primary_email_id,
    :primary_image_id,
    :primary_phone_id,
    :date_of_birth,
    :name,
    :primary_kind,
    :status,
  ].freeze

  def display_resource(person)
    "Person: #{person.name}"
  end
end
