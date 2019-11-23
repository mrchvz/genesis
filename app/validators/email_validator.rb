class EmailValidator < ActiveModel::EachValidator
  EMAIL_NAME_REGEX            = '[A-Z0-9_\.&%\+\-\']+'
  DOMAIN_HEAD_REGEX           = '(?:[A-Z0-9\-]+\.)+'
  DOMAIN_TLD_REGEX            = '(?:[A-Z]{2,25})'
  EMAIL_REGEX_WITHOUT_ANCHORS = /#{EMAIL_NAME_REGEX}@#{DOMAIN_HEAD_REGEX}#{DOMAIN_TLD_REGEX}/i
  EMAIL_REGEX                 = /\A#{EMAIL_NAME_REGEX}@#{DOMAIN_HEAD_REGEX}#{DOMAIN_TLD_REGEX}\z/i

  def validate_each(record, attribute, value)
    unless value =~ EMAIL_REGEX
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end
