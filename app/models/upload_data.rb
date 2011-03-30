require 'carrierwave/orm/mongoid'
class UploadData
  include Mongoid::Document
  
  field :title, :type => String
  mount_uploader :image, ImageUploader
end
