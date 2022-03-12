require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development? # 開発中もs3使う
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'onsen-image'
    config.asset_host = 'https://s3.amazonaws.com/onsen-image'
    # NOTE: AWS側の設定を変えなくても、この１行の設定でアップロードできた
    config.fog_public = false # ←コレ
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: 'AKIAUAG2DQKKQ2U4ILVV',
        aws_secret_access_key: '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',
        region: 'ap-northeast-1'
      }
    # config.cache_storage = :fog
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end