class Organization < ApplicationRecord
  has_many :addressable_addresses, class_name: 'Address', dependent: :destroy
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :attachable_attachments, class_name: 'Attachment', dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :authentications, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :emailable_emails, class_name: 'Email', dependent: :destroy
  has_many :emails, as: :emailable, dependent: :destroy
  has_many :imageable_images, class_name: 'Image', dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :item_lead_mappings, dependent: :destroy
  has_many :item_testimonial_mappings, dependent: :destroy
  has_many :leads, dependent: :destroy
  has_many :people, dependent: :destroy
  has_many :phoneable_phones, class_name: 'Phone', dependent: :destroy
  has_many :phones, as: :phoneable, dependent: :destroy
  has_many :social_proofs, dependent: :destroy
  has_many :testimonials, dependent: :destroy

  belongs_to :primary_address, class_name: 'Address', optional: true
  belongs_to :primary_email, class_name: 'Email', optional: true
  belongs_to :primary_image, class_name: 'Image', optional: true
  belongs_to :primary_phone, class_name: 'Phone', optional: true

  enum status: {
    ACTIVE: 0,
    INACTIVE: 10
  }

  validates :name, {
    presence: true,
    length: {
      in: 1..255
    }
  }
  validates :status, {
    presence: true
  }
  validates :subdomain, {
    presence: true,
    uniqueness: true,
    format: {
      with: /\A(?![0-9]+$)(?!-)[a-zA-Z0-9-]{,63}(?<!-)\z/i,
      messages: "%{value} must consists numbers, letter or hyphens, but cannot begin nor end with hyphens."
    },
    exclusion: {
      in: %w[api assets www],
      message: "%{value} is reserved for internal use."
    }
  }
  # convert to video context enum and video content
  validates :url, {
    url: true,
    allow_nil: true
  }
end
