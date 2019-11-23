# NOTE: Based on USPS address requirements
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  belongs_to :organization

  enum country_code: IsoCountryCodes::Code.descendants.map{|d| [d.alpha2, d.numeric.to_i]}.to_h

  acts_as_list(scope: %i[organization_id addressable_type addressable_id])

  validates :city, {
    presence: true,
    length: {
      in: 2..50
    }
  }
  validates :confirmed, {
    inclusion: {
      in: [true, false]
    }
  }
  validates :country_code, {
    presence: true
  }
  validates :label, {
    uniqueness: {
      scope: %i[organization_id addressable_type addressable_id]
    },
    length: {
      in: 2..255
    },
    allow_nil: true
  }
  validates :line_1, {
    presence: true,
    length: {
      in: 2..46
    }
  }
  validates :line_2, {
    length: {
      in: 2..46
    },
    allow_nil: true,
    allow_blank: true
  }
  validates :line_3, {
    length: {
      in: 2..46
    },
    allow_nil: true,
    allow_blank: true
  }
  validates :state_province_county, {
    presence: true,
    length: {
      in: 2..50
    }
  }
  validates :zip_postal_code, {
    presence: true,
    length: {
      in: 2..15
    }
  }

  def calculated_full_address
    [
      line_1,
      line_2,
      line_3,
      state_province_county,
      IsoCountryCodes.find(self.country_code).name,
      zip_postal_code
    ].compact.join(', ')
  end

  def calculated_partial_address
    [
      state_province_county,
      IsoCountryCodes.find(self.country_code).name
    ].compact.join(', ')
  end
end
