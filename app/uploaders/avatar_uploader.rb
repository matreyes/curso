# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/assets/fallback/default_avatar.jpeg"
  end

  process :resize_to_fill => [200,200]

  version :thumb do
    process :resize_to_fill => [50, 50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
