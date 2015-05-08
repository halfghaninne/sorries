class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :validates_user
  
  def validates_user
    if session[:user_id] !=nil
      @user = User.find(id: session[:user_id])[0]
    end
  end
  
  def home
    render "/home"
  end
  
end
