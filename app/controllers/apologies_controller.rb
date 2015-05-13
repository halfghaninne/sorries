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
    if params[:apology]
      if !params[:apology].include?("could_communicate_differently") || !params[:apology].include?("was_warranted") || !params[:apology].include?("relationship") || !params[:apology].include?("gender")
        flash[:message] = "Please fill out all of the form fields."
        redirect_to controller: "apologies", action: "new"
      else 
        newApology = @user.apologies.create!(params[:apology])
        flash[:message] = "Record saved!"
        redirect_to controller: "application", action: "home"
      end
    end
  end
  
  def index
    # @test = Apology.where(user_id: @user.id)
    @apologies = @user.apologies
    @dates = @user.apologies.distinct(:date)
  end
  
end