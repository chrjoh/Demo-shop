require 'carrierwave/processing/mini_magick'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :resize_to_fit => [290, 70]

  version :thumb do
    process :resize_to_fill => [80, 40]
  end
end
        

