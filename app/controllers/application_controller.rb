class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :signed_in?, :current_user

  def current_user
    return nil if self.session[:session_token].nil?
    @cu ||= User.find_by_session_token(self.session[:session_token])
  end

  #review this
  def signed_in?
    !!current_user
  end

  #r
  def login!(user)
    user.reset_session_token!
    self.session[:session_token] = user.session_token
  end

  def log_out!
    self.session[:session_token] = nil
  end

  def redirect_to_login_if_not_signed_in
    redirect_to new_session_url unless signed_in?
  end

  def redirect_to_bands_index_if_signed_in
    redirect_to bands_url if signed_in?
  end


end
