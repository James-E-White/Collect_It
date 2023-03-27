class UsersController < ApplicationController
  def new; end

  def create
    user = User.create(app_params)
    if user.valid?
      flash[:success] = "Welcome, #{user.username}"
      redirect_to user_path(user)
    else
      flash[:alert] = "Error: #{error_message(user.errors)}"
      redirect_to "/"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def app_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
