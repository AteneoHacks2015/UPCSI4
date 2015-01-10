class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :sponsor?, :applicant?

  before_filter :set_cache_buster

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def current_user
  	@current_user ||= Accounts.find_by_id(session[:user_id]) if session[:user_id]
  end

  def sponsor?
    current_user != nil and current_user.tag == 1
  end

  def applicant?
    current_user != nil and current_user.tag == 0
  end

  def deny_access
    redirect_to :root
  end
  
  def logged_in?
    if current_user == nil
      deny_access
    end
  end 

end
