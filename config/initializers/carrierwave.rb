require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  # 開発環境もしくは本番環境である場合
  if Rails.env.development? || Rails.env.test?
    # ローカル
    config.storage = :file
  elsif Rails.env.production? #本番はS3に保存する
    # 本番環境
    config.storage = :fog
    # AWS S３用のファイル→fog
    config.fog_provider = 'fog/aws'
    # AWS をつなぐための回線
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }
    # AWS をつなげるための情報
    config.fog_directory  = 'teamdfurima-2020'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/teamdfurima-2020'
  end
end

