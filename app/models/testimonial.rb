class Testimonial < ApplicationRecord
  has_many :images, as: :imageable, dependent: :destroy
  has_many :item_testimonial_mappings, dependent: :destroy

  belongs_to :after_image, class_name: 'Image', optional: true
  belongs_to :before_image, class_name: 'Image', optional: true
  belongs_to :organization
  belongs_to :person

  enum status: {
    DRAFT: 0,
    SUBMITTED: 10,
    ACCEPTED: 20,
    REJECTED: 30
  }

  enum source: {
    INTERNAL: 0,
    EXTERNAL: 10
  }

  validates :person, {
    inclusion: {
      in: proc do |t|
        if t.person && t.organization
          Person.where(
            organization: t.organization,
            primary_kind: :CONSUMER,
            id: t.person.id
          )
        else
          Person.none
        end
      end
    }
  }

  validates :date, {
    date: true,
    on: :update
  }
  validates :long_text, {
    presence: true,
    length: {
      in: 1..2048
    }
  }
  validates :rating, {
    presence: true,
    numericality: {
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 5
    },
    if: proc { |testimonial| testimonial.source == 'EXTERNAL' }
  }
  validates :rating, {
    absence: true,
    if: proc { |testimonial| testimonial.source == 'INTERNAL' }
  }
  validates :short_text, {
    presence: true,
    length: {
      in: 1..255
    }
  }
  validates :status, {
    presence: true
  }
  validates :source, {
    presence: true
  }
  validates :url, {
    url: true,
    allow_nil: true
  }
end
