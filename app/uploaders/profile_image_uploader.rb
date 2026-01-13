class ProfileImageUploader < CarrierWave::Uploader::Base
  # Railsの画像パスヘルパーを使えるようにする
  include ActionView::Helpers::AssetUrlHelper

  # 本番環境と開発環境で保存先を変える
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # アップロード画像の保存先ディレクトリ
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # ★重要：デフォルト画像のパス設定
  # Railsに「本番用の正しいファイル名を探してきて」と命令する書き方
  def default_url(*args)
    ActionController::Base.helpers.asset_path("img/no_image.jpg")
  end
end