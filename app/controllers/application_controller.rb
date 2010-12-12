class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :authorize, :except => :new 

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_url] = request.request_uri
      flash[:notice] = "Please login"
      redirect_to new_session_path
    end
  end
end
