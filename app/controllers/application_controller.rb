class ApplicationController < ActionController::Base
  helper_method :logged_in?
  helper_method :current_user
  def logged_in?
    session[:user_id].present?
  end
    def error_message(errors)
    errors.details.keys.map do |field|
      errors.full_messages_for(field).first
    end.join(", ") 
  end

  def current_user
 
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    puts "Current User: #{@current_user}"
    @current_user
  end

end
