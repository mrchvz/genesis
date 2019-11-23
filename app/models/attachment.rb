class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  belongs_to :organization

  acts_as_list(scope: %i[organization_id attachable_type attachable_id])

  mount_base64_uploader :payload, AttachmentPayloadUploader

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
