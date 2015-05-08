require 'pry'

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :validates_user
  
  def validates_user
    if session[:user_id] !=nil
      @user = User.find(session[:user_id])
    end
  end
  
  def home
    render "/home"
  end
  
end
