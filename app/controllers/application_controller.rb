class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_logged_in, except: [:signin]

  class AccessDenied < StandardError
  end

  rescue_from AccessDenied, with: :access_denied

  def access_denied
    render "public/404", layout: false, status: 404
  end

  def ensure_logged_in
    unless session[:user_id] != nil
      redirect_to signin_path
    end
  end



end
