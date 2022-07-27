class PasswordResetsController < ApplicationController
  def new
    if logged_in?
      flash[:warning] = 'Edit your password'
      redirect_to root_path
    end
  end

  def reset_send
    @user = User.find_by(email: params[:email])
    PasswordMailer.with(user: @user).reset.deliver_later if @user.present?
    flash[:success] = 'If that account was found with that email, We will send a password reset link.'
    redirect_to root_path
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    flash[:danger] = 'Invalid token reset password again.'
    redirect_to signin_path
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      flash[:success] = 'Your passowrd was reset successfully. Please signin.'
      redirect_to signin_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
