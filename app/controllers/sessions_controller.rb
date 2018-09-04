class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.username}!"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have succesfully logged out."
    redirect_to root_path
  end
end
