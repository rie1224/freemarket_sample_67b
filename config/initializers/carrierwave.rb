require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id2: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key2: Rails.application.secrets.aws_secret_access_key,
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'freemarketsample67bb'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/freemarketsample67bb'
end