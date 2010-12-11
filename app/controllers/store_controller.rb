class StoreController < ApplicationController
  def index
    @products = Product.find_all_products_for_sale
  end

  def find_cart
    session[:cart] ||= Cart.new
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @cart.add_product(product)
    puts @cart.inspect
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempting to fetch the product #{params[:id]}" )
    redirect_to_index("Invalid product")
  end

  def empty_cart
    session[:cart] = nil
    redirect_to_index("Your cart is currently empty")
  end
  
  private
  def redirect_to_index(msg = nill)
    flash[:notice] = msg
    redirect_to :action => 'index'
  end
end
