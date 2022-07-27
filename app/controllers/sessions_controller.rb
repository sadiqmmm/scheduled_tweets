class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'User signin successfully.'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid Email or Passowrd.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil

    flash[:danger] = 'User Signout successfully'
    redirect_to root_path
  end
end
