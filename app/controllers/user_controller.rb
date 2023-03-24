class UserController < ApplicationController
  def create 
    user = User.create(app_params)
    if user.valid?
      redirect_to user_path(user)
    else 
      flash[:alert] = "Error: #{error_message(user.errors)}"
      redirect_to register_path
    end
  end

  def show 
    @user = User.find(params[:id])
  end

  private
  def app_params 
    params.permit(:name, :email)
  end
end