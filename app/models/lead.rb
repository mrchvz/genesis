# TODO Add status change timestamps
#
class Lead < ApplicationRecord
  has_many :item_lead_mappings, dependent: :destroy

  belongs_to :organization
  belongs_to :person

  enum desired_time_range: {
    ANYTIME: 0,
    MORNING: 10,
    AFTERNOON: 20,
    EVENING: 30
  }
  enum preferred_conversation_channel: {
    PHONE: 0,
    EMAIL: 10
  }
  enum source: {
    WEBSITE: 0
  }
  enum status: {
    DRAFT: 0,
    SUBMITTED: 10,
    ACCEPTED: 20,
    REJECTED: 30,
    CANCELLED: 40
  }

  validates :person, {
    inclusion: {
      in: proc do |l|
        if l.person && l.organization
          Person.where(
            organization: l.organization,
            primary_kind: :CONSUMER,
            id: l.person.id
          )
        else
          Person.none
        end
      end
    }
  }

  validates :desired_date, {
    presence: true,
    date: {
      after: proc { Date.today }
    },
    on: :create
  }
  validates :desired_date, {
    presence: true,
    date: true,
    on: :update
  }
  validates :message, {
    length: {
      in: 0..2048
    },
    allow_nil: true
  }
  validates :source, {
    presence: true
  }
  validates :status, {
    presence: true
  }
end
