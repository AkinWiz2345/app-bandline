CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_public = false
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION']
  }

  #config.fog_directory  = 'www.cloud9bandline.com'
  config.fog_directory  = 'www.awsbandline.com'
  
  # config.asset_host = 'https://www.cloud9bandline.com.s3.amazonaws.com'
  config.cache_storage = :fog
end
