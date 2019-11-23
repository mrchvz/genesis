class BaseUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  case Rails.env
  when 'production', 'staging'
    self.storage :fog
  when 'development'
    self.storage :file
  else
    raise StandardError.new("Unsupported context #{Rails.env} while calling #{__method__}")
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def content_type_blacklist
    ['application/text', 'application/json']
  end

  # TODO: Add collision avoidance mechanism
  def filename
    return unless original_filename
    if model.instance_variable_get('@_temporal_filename')
      model.instance_variable_get('@_temporal_filename')
    else
      timestamp = DateTime.now.strftime("%d-%m-%Y-%H-%M")
      random_id = SecureRandom.hex
      temporal_filename = "#{timestamp}-#{random_id}-#{original_filename}"
      model.instance_variable_set('@_temporal_filename', temporal_filename)
    end
  end
end
