class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:failure] = "Incorrect credentials, please try again."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    params_no_empty_fields = user_params.reject! {|k, v| v == ""}
    @user = User.find(params[:id])
    if @user.update(params_no_empty_fields)
      flash[:success] = "Profile succesfully updated!"
      redirect_to user_path(@user)
    else
      flash[:failure] = "Something went wrong, please try again."
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :email, :phone, :first_name, :last_name, :image)
    end
end
