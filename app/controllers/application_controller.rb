class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def check_login
    if session[:user_id] == nil
      redirect_to new_user_path
    else
      @user = User.find(session[:user_id])
    end
  end
end
