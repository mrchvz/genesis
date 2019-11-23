Aws.config.update({
  region: ENV.fetch('AWS_REGION'),
  credentials: Aws::Credentials.new(ENV.fetch('AWS_ID'), ENV.fetch('AWS_KEY'))
})
