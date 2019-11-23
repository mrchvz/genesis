class Phone < ApplicationRecord
  include ActionView::Helpers::NumberHelper

  belongs_to :phoneable, polymorphic: true
  belongs_to :organization

  acts_as_list(scope: %i[organization_id phoneable_type phoneable_id])

  enum country_code: IsoCountryCodes::Code.descendants.map{|d| [d.alpha2, d.numeric.to_i]}.to_h

  validates :confirmed, {
    inclusion: {
      in: [true, false]
    }
  }
  validates :country_code, {
    presence: true
  }
  validates :extension, {
    numericality: {
      only_integer: true
    },
    length: {
      in: 0..32
    },
    allow_nil: true
  }
  validates :label, {
    uniqueness: {
      scope: %i[organization_id phoneable_type phoneable_id]
    },
    length: {
      in: 2..255
    },
    allow_nil: true
  }
  validates :number, {
    presence: true,
    numericality: {
      only_integer: true
    },
    phone: {
      possible: true,
      types: [
        :personal_number,
        :fixed_or_mobile,
        :voip
      ],
      country_specifier: -> phone { phone.country_code },
      extensions: false
    }
  }

  def number
    if super && super != ''
      super.split(//).map {|x| x[/\d+/]}.compact.join("")
    end
  end

  def number=(number)
    number = number.to_s

    if number && number != ''
      super(number.split(//).map {|x| x[/\d+/]}.compact.join(""))
    end
  end

  def extension
    if super && super != ''
      super.split(//).map {|x| x[/\d+/]}.compact.join("")
    end
  end

  def extension=(extension)
    extension = extension.to_s

    if extension && extension != ''
      super(extension.split(//).map {|x| x[/\d+/]}.compact.join(""))
    end
  end

  def calculated_calling_country_code
    IsoCountryCodes.find(self.country_code).calling.split(//).map {|x| x[/\d+/]}.compact.join("")
  end

  def calculated_full_number
    number_to_phone(
      self.number,
      country_code: self.calculated_calling_country_code,
      area_code: true,
      extension: self.extension
    ).sub('-', ' ')
  end
end
