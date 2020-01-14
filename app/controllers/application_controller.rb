class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 require 'sessions_helper'
def current_user
@current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def logged_in?
  !!current_user
end

def require_user
  if !logged_in?
    flash[:danger] = "You must be logged in to do that."
    redirect_to root_path
  end
end
def sign_in(user)
   self.current_user = user
end
def signed_in?
  !current_user.nil?
end
def current_user=(user)
  @current_user = user
end
def current_user
@current_user ||= User.find(session[:user_id]) if session[:user_id]
end
def sign_out
  self.current_user = nil
 end
 def current_user?(user)
   user == current_user
end
def redirect_back
  redirect_to(session[:return_to] || default)
  session.delete(:return_to)
 end
 def store_location
    session[:return_to] = request.fullpath
 end
end
