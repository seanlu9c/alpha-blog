class SessionsController < ApplicationController
  
  def new
    # new action = render a form
  end
  
  def create
    # the form's submit, is handle by "create"
    # meaning start the seesion, display user as logged-in state
    
    
    # render 'new'
    # debugger
    
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # no model >> no validation method
      
      # save in browser cookie
      session[:user_id] = user.id
      
      # flash[:succes] = "You have successfully logged in"  <<< show with no color !! 
      flash[:success] = "You have successfully logged in"
      # redirect_to users_path(user)      >> causing user.7 ??
      redirect_to user_path(user)
      
    else
      # not the regular "flash"... flash persist for 1 http-request,  see request on next screen
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  
  def destroy
    # for logout, need destroy
    # meaning stop the session, user as logged-out state
    session[:user_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
    
  end
  
end