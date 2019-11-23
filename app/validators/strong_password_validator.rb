class StrongPasswordValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value
    unless value =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[^\w\d\s:])([^\s]){8,20}\z/
      record.errors[attribute] << (options[:message] || 'must be between 8-16 characters, must contain at least one uppercase letter, one special character and one digit')
    end
  end
end
