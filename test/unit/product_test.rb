require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "should check that we fill in mandatory fields" do
    product = Product.new
    assert !product.valid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
  end
  
  test "price_must_be_positive" do
    product = Product.new(:title => 'title', :description => 'Description', :image_url => 'kalle.jpg')
    product.price = -1
    assert !product.valid?
    product.price = 0
    assert !product.valid?
    product.price = 1.0
    assert product.valid?
  end
end
