require 'carrierwave/processing/mini_magick'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :resize_to_fit => [200, 200]

  version :thumb do
    process :resize_to_fill => [80, 80]
  end
end
        

