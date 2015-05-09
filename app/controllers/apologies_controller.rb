class ApologiesController < ApplicationController
  
  before_filter :validates_user
  
  def validates_user
    if session[:user_id] !=nil
      @user = User.find(session[:user_id])
    else
      flash[:message] = "Please log in or sign up to use the service."
      redirect_to controller: "application", action: "home"
    end
  end
  
  def new
    @apology = Apology.new
  end
  
  # def preview
  # end
  
  def create
    newApology = @user.apologies.create!(params[:apology])
    
    flash[:message] = "Saved!"
    redirect_to controller: "application", action: "home"
  end
  
  def index
    @apologies = @user.apologies
  end
  
end