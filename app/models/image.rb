class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true
  belongs_to :organization

  acts_as_list(scope: %i[organization_id imageable_type imageable_id])

  mount_base64_uploader :payload, ImagePayloadUploader

  validates :description, {
    length: {
      in: 0..512
    },
    allow_nil: true
  }
  validates :payload, {
    presence: true
  }
  validates :title, {
    presence: true,
    length: {
      in: 2..255
    }
  }
end
