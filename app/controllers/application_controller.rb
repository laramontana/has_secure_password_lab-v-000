class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login, :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to login_path unless !!current_user
  end

  def logged_in?
    session[:user_id].present?
  end


end
