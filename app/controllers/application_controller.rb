class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :admin_user

  def current_user
  	return nil if session[:user_id].nil?
  	User.sql_find_by_id(session[:user_id])
  end

  def ensure_that_user_signed_in
  	redirect_to signin_path, notice: "You should be signed in" if current_user.nil?
  end

  def admin_user
  	return false if session[:user_id].nil?
  	current_user.admin
  end

  def ensure_that_user_is_admin
  	redirect_to :root, notice: "Back off, you are not the admin" unless self.admin_user
  end

end
