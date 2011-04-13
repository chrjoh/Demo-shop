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
      url = session[:original_uri]
      session[:original_uri] = nil
      redirect_to url || orders_path
    else
      redirect_to new_session_path
    end
  end

  # logout the user
  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def show
  end

  def index
  end

end
