class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  # default avail to all Controllers
  # default not avail to VIEWS
  
  # HELPER_METHOD makes avail to VIEWS
  helper_method :current_user, :logged_in?
  
  
  
  def current_user
    # IF NOT "||="  then find ...
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # convert to BOOLEAM using "bang,bang."
    !!current_user
    # if have then return true
  end
  
  def require_user
    if !logged_in?
      flash.now[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
    
  end
  
end
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  # default avail to all Controllers
  # default not avail to VIEWS
  
  # HELPER_METHOD makes avail to VIEWS
  helper_method :current_user, :logged_in?
  
  
  
  def current_user
    # IF NOT "||="  then find ...
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # convert to BOOLEAM using "bang,bang."
    !!current_user
    # if have then return true
  end
  
  def require_user
    if !logged_in?
      flash.now[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
    
  end
  
end
