unless Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: 'AKIAUAG2DQKKRJTPNB7A',
        aws_secret_access_key: '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',
        region: 'ap-northeast-1'
      }
  
      config.fog_directory  = 'onsen-image'
      config.cache_storage = :fog
    end
  end