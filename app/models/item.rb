class Item < ApplicationRecord
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  has_many :item_lead_mappings, dependent: :destroy
  has_many :item_testimonial_mappings, dependent: :destroy

  belongs_to :category, optional: true
  belongs_to :organization
  belongs_to :primary_attachment, class_name: 'Attachment', optional: true
  belongs_to :primary_image, class_name: 'Image', optional: true

  acts_as_list(scope: %i[organization_id category_id form])

  enum form: {
    ABSTRACT: 0,
    CONCRETE: 10
  }
  enum primary_kind: {
    PRODUCT: 0,
    SERVICE: 10
  }
  enum status: {
    ACTIVE: 0,
    INACTIVE: 10
  }

  validates :category, {
    presence: true,
    if: proc { |i| i.form && i.form == 'CONCRETE' }
  }

  validates :category, {
    absence: true,
    if: proc { |i| i.form && i.form == 'ABSTRACT' }
  }

  validates :external_price_in_cents, {
    presence: true,
    numericality: {
      greater_than_or_equal_to: 0
    },
    if: proc { |i| i.form == 'CONCRETE' }
  }
  validates :external_price_in_cents, {
    numericality: {
      greater_than_or_equal_to: 0
    },
    allow_nil: true,
    if: proc { |i| i.form == 'ABSTRACT' }
  }
  validates :form, {
    presence: true
  }
  validates :internal_price_in_cents, {
    presence: true,
    numericality: {
      greater_than_or_equal_to: 0
    },
    if: proc { |i| i.form == 'CONCRETE' }
  }
  validates :internal_price_in_cents, {
    numericality: {
      greater_than_or_equal_to: 0
    },
    allow_nil: true,
    if: proc { |i| i.form == 'ABSTRACT' }
  }
  validates :key, {
    presence: true,
    length: {
      in: 1..255
    },
    format: {
      with: /\A(?!_)\w*(?<!_)\z/,
      messages: "%{value} must consists numbers, letter or underscores, but cannot begin nor end with underscores."
    },
    uniqueness: {
      scope: %i[organization_id]
    },
    if: proc { |i| i.form == 'ABSTRACT' }
  }
  validates :key, {
    presence: true,
    length: {
      in: 1..255
    },
    format: {
      with: /\A(?!_)\w*(?<!_)\z/,
      messages: "%{value} must consists numbers, letter or underscores, but cannot begin nor end with underscores."
    },
    uniqueness: {
      scope: %i[organization_id category_id]
    },
    if: proc { |i| i.form == 'CONCRETE' }
  }
  validates :name, {
    presence: true,
    length: {
      in: 1..255
    }
  }
  validates :long_description, {
    presence: true,
    length: {
      in: 1..4096
    }
  }
  validates :primary_kind, {
    presence: true
  }
  validates :short_description, {
    presence: true,
    length: {
      in: 1..255
    }
  }
  validates :status, {
    presence: true
  }
  validates :url, {
    url: true,
    allow_nil: true,
    if: proc { |i| i.form == 'CONCRETE' }
  }
  validates :url, {
    presence: true,
    url: true,
    if: proc { |i| i.form == 'ABSTRACT' }
  }
end
