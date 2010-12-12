class OrdersController < ApplicationController

  skip_before_filter :authorize, :only => [:new, :create]
  before_filter :find_cart
  
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    if @cart.items.empty?
      redirect_to_index("Your cart is empty")
    else
      @order = Order.new
      @hide_checkout_button = true
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @order }
      end
      
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:order])
    @order.add_line_items_from_cart(@cart)
    respond_to do |format|
      if @order.save
        session[:cart] = nil
        format.html { redirect_to_index("Thank you for your order") }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(orders_url) }
      format.xml  { head :ok }
    end
  end

  private  
  def find_cart
    session[:cart] ||= Cart.new
    @cart = session[:cart]
  end
  

  def redirect_to_index(msg = nil)
    flash[:notice] = msg
    redirect_to store_index_path
  end
  
end
