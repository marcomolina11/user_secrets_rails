class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
  	if session[:user_id]
  		return true
  	else 
  		return false
  	end
  end
  helper_method :current_user
  
  def require_login
    redirect_to "/sessions/new" if session[:user_id] == nil
  end
end
