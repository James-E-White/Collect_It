class ApplicationController < ActionController::Base
  helper_method :logged_in?

  def logged_in?
    session[:user_id].present?
  end
    def error_message(errors)
    errors.details.keys.map do |field|
      errors.full_messages_for(field).first
    end.join(", ") 
  end

end
