class StoreController < ApplicationController
  def index
    @products = Product.find_all_products_for_sale
    @cart = find_cart
  end

  def find_cart
    session[:cart] ||= Cart.new
  end

  def add_to_cart
    product = Product.find(params[:id])
    @cart = find_cart
    @current_item = @cart.add_product(product)
    respond_to do |format|
      format.js if request.xhr?
      format.html {redirect_to_index}
    end
  rescue ActiveRecord::RecordNotFound
    logger.error("Attempting to fetch the product #{params[:id]}" )
    redirect_to_index("Invalid product")
  end

  def empty_cart
    session[:cart] = nil
    respond_to do |format|
      format.js if request.xhr?
      format.html {redirect_to_index}
    end
  end

  def checkout
    @cart = find_cart
    if @cart.items.empty?
      redirect_to_index("Your cart is empty")
    else
      @order = Order.new
    end
  end

  private
  def redirect_to_index(msg = nil)
    flash[:notice] = msg
    redirect_to :action => 'index'
  end
end
