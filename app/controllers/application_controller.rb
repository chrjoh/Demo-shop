class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize, :except => [:new, :create]

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      session[:original_url] = request.fullpath
      flash[:notice] = "Please login"
      redirect_to new_session_path
    end
  end
end
