require 'carrierwave/orm/mongoid'
class UploadData
  include Mongoid::Document
  mount_uploader :image, ImageUploader
end
