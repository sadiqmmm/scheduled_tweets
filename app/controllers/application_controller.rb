class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authentication!
    unless current_user
      flash[:danger] = "You aren't authorized to visit that page."
      redirect_to root_path
    end
  end
end
