class UrlValidator < ActiveModel::EachValidator
  URL_REGEX = /\A(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?\z/ix

  def validate_each(record, attribute, value)
    unless value =~ URL_REGEX
      record.errors[attribute] << (options[:message] || "is not an url")
    end
  end
end
