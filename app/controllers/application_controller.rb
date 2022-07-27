class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning

  helper_method :logged_in?, :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authentication!
    unless logged_in?
      flash[:danger] = "You aren't authorized to visit that page."
      redirect_to signin_path
    end
  end
end
