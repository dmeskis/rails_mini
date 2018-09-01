class DashboardController < ApplicationController
  before_action :require_logged_in
  
  def index

  end

  def require_logged_in
    render file: "/public/404" unless session[:user_id]
  end
end
