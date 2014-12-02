class PagesController < ApplicationController

  before_action :check_user_id, except: [:signin]

  def index
  end

  def signin
    
  end

  private

  def check_user_id
    unless session[:user_id] == (3 || nil)
      raise AccessDenied
    end
  end

end
