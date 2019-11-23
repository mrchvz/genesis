class ItemLeadMapping < ApplicationRecord
  belongs_to :item
  belongs_to :lead
  belongs_to :organization
end
