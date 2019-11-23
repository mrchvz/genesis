class Category < ApplicationRecord
  has_many :images, as: :imageable, dependent: :destroy
  has_many :items, dependent: :destroy

  belongs_to :organization
  belongs_to :primary_image, class_name: 'Image', optional: true

  acts_as_list(scope: %i[organization_id])

  enum status: {
    ACTIVE: 0,
    INACTIVE: 10
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
    }
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
      in: 1..512
    }
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
end
