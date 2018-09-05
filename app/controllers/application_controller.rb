class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_teacher?
    current_user && current_user.teacher?
  end

  def current_guardian?
    current_user && current_user.guardian?
  end
end
