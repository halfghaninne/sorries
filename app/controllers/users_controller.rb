class UsersController < ActionController::Base
  
  def new
    @user = User.new
  end
  
  def create
    password_key = BCrypt::Password.create(params[:user][:password]) 
    params[:user][:password] = password_key 
    newUser = User.create(params[:user])
    
    flash[:message] = "Account created! Please log in:"
    
    redirect_to controller: "users", action: "login"
  end
  
  def login
  end
  
  def find
    username = params[:user][:username]
    @user = User.where( username: username )[0]
    
    if @user
      if BCrypt::Password.new(@user.password) == params[:user][:password] 
        session[:user_id] = @user.id 
        redirect_to controller: "application", action: "home"
      else
        flash[:message] = "Wrong password. Try again."
        redirect_to controller: "users", action: "login"
      end
    else
      flash[:message] = "We didn't recognize that username."
      redirect_to controller: "users", action: "login"
    end
    
  end
  
  # def show
  # end
  
  def logout
    session[:user_id] = nil 
    @user = nil
    redirect_to controller: "application", action: "home"
  end

  
end