class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:warning] = 'You\'ve already signed in.'
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Signin successfully.'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid Email or Passowrd.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil

    flash[:danger] = 'Signout successfully'
    redirect_to root_path
  end
end
