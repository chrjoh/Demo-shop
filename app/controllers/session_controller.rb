class SessionController < ApplicationController

  # show login from
  def new
  end

  # perform the login
  def create
    session[:user_id] = nil
    user = User.authenticate(params[:name], params[:password])
    if user
      session[:user_id] = user.id
      puts "session[:user_id] => #{session[:user_id]}"
      url = session[:original_uri]
      session[:original_uri] = nil
      redirect_to url || orders_path
    end
  end

  # logout the user
  def logout
    session[:user_id] = nil
    redirect_to store_index_path
  end

  def show
  end

  def index
  end

end
