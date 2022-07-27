class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = 'User signin successfully.'
      redirect_to root_path
    else
      flash[:danger] = 'Invalid sign in details.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil

    flash[:danger] = 'User Signout successfully'
    redirect_to root_path
  end
end
