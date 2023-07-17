class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, #{@user.username}"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Error: #{error_message(@user.errors)}"
      redirect_to '/register'
    end
  end

 def show
  @facade = ComicsFacade.new(params[:id], params[:query])
  if logged_in?
    @user = User.find_by(params[:id])
    if @user.nil?
      flash[:alert] = 'Error: User not found'
      redirect_to '/'
    end
  else
    flash[:alert] = 'Error: You must be logged in or registered to access my dashboard'
    redirect_to '/'
  end
end


  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash[:alert] = 'Incorrect Email or Password'
      redirect_to '/login'
    end
  end

  def logout_user
    reset_session
    redirect_to '/'
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
