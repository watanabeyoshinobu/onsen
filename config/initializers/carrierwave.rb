require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'onsen-image'
    config.asset_host = 'https://s3.amazonaws.com/onsen-image'
    config.fog_public = false
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: 'AKIAUAG2DQKKV6PMPKI3',
        aws_secret_access_key: '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',
        region: 'ap-northeast-1'
      }
    #config.cache_storage = :fog
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end