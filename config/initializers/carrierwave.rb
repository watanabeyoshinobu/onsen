# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

# CarrierWave.configure do |config|
#   if Rails.env.production? || Rails.env.development?
#     config.storage :fog
#     config.fog_provider = 'fog/aws'
#     config.fog_directory  = 'onsen-image'
#     config.asset_host = 'https://s3.amazonaws.com/onsen-image'
#     config.fog_public = false
#     config.fog_credentials = {
#         provider: 'AWS',
#         aws_access_key_id: ENV['S3_ACCESS_KEY'],
#         aws_secret_access_key: ENV['S3_SECRET_KEY'],
#         region: 'ap-northeast-1'
#       }
#     #config.cache_storage = :fog
#   else
#     config.storage :file
#     config.enable_processing = false if Rails.env.test?
#   end
# end

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development?
    config.storage :fog
    config.cache_storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'onsen-image2'
    config.fog_public = false
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['S3_ACCESS_KEY'],
        aws_secret_access_key: ENV['S3_SECRET_KEY'],
        region: 'ap-northeast-1'
      }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end