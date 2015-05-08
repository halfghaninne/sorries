class ApologiesController < ActionController::Base
  
  before_filter :validates_user
  
  def validates_user
    if session[:user_id] !=nil
      @user = User.find(id: session[:user_id])[0]
    else
      flash[:message] = "Please log in or sign up to use the service."
      redirect_to controller: "application", action: "home"
  end
  
  def new
    @apology = Apology.new
  end
  
  # def preview
  # end
  
  def create
    newApology = Apology.create(params[:apology])
    
    flash[:message] = "Saved!"
    redirect_to controller: "application", action: "home"
  end
  
  def index
    @apologies = Apology.where(user_id: @user.id)
    #TODO check this syntax
  end
  
end