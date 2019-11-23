CarrierWave.configure do |config|
  case Rails.env
  when 'production', 'staging'
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV.fetch('AWS_ID'),
      aws_secret_access_key: ENV.fetch('AWS_KEY')
    }
    config.fog_directory = ENV.fetch('AWS_UPLOADS_BUCKET_NAME')
  when 'development'
    config.root = Rails.root.join('public')
    config.storage = :file
  else
    raise StandardError.new("Unsupported context #{Rails.env} while calling #{__method__}")
  end
end
