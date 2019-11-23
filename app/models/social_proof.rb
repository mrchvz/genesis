class SocialProof < ApplicationRecord
  has_many :images, as: :imageable, dependent: :destroy

  belongs_to :organization
  belongs_to :primary_image, class_name: 'Image', optional: true

  acts_as_list(scope: %i[organization_id])

  validates :description, {
    length: {
      in: 0..512
    },
    allow_nil: true
  }
  validates :title, {
    presence: true,
    length: {
      in: 2..255
    }
  }
  validates :url, {
    presence: true,
    url: true
  }
end
