class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user,only: [:edit, :update]
  def index
    @users=User.all
  end
  def new
    @user=User.new
  end
  def show
    @user=User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to the Sample App!"
        redirect_to users_path(@users)
      else
      render 'new'
    end
  end
  def edit
      @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
            # Handle a successful update.\
          flash[:success] = "Profile updated"
           redirect_to @user
    else
      render 'edit'
    end
  end
  private
  def signed_in_user
   unless signed_in?
     store_location
     redirect_to signin_path, notice: "Please sign in."
   end
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
