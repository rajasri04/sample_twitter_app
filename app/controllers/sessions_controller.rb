class SessionsController < ApplicationController
  def new
  end
  def create
    @users = User.find_by(email: params[:session][:email])
    if @users.password == params[:session][:password]
      session[:user_id] = @users.id
      redirect_to users_path(@users)
      flash[:success] = "You have successfully logged in"
    else
      flash.now[:error] = "Invalid login credentials"
      render 'new'
    end

  end
  def destroy
    session[:user_id] = nil
		flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end
