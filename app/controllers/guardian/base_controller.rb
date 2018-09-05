class Guardian::BaseController < ApplicationController
  before_action :require_guardian

  def require_guardian
    render file: "/public/404" unless current_guardian?
  end
end
