class Product < ActiveRecord::Base
  validates_presence_of :title, :description
  validates_numericality_of :price
  validate :price_must_be_positive
  validates_format_of :image_url,
                      :with => %r{\.(gif|jpg|jpeg|png)$}i,
                      :message => 'Must be a gif, jpg, jpeg or png image'
  
  protected
  def price_must_be_positive
    errors.add(:price, 'Should be positive') if price.blank? || price <= 0
  end
end
