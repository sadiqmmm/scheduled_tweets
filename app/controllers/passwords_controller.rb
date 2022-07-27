class PasswordsController < ApplicationController
  before_action :authentication!, only: %i[edit update]

  def edit; end

  def update
    if current_user.update(password_params)
      flash[:success] = 'Password updated successfully.'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid Passowrd.'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
