# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
  
  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/" + [version_name, "no_image.png"].compact.join('_')
  end
 
  version :thumb do
    process resize_to_fill: [50, 50]
  end

  version :normal do
    process resize_to_fill: [100,100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
