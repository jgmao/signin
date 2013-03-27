class SessionsController < ApplicationController
  before_filter :set_no_cache
  def new
    @title ="Sign in"
    if signed_in?
      redirect_to newreaction_path #redirect
    end
  end
  def create#this is what happen when click submit
    user = User.authenticate(params[:session][:name],params[:session][:password])
    if user.nil?
      # Create an error message and re-render the signin form.
      flash.now[:error] = "Invalid email/password combination."#display err msg
      @title = "Sign in" 
      render 'new'#go back to new
  
    else
      # Sign the user in and redirect to the user's show page.
      sign_in user 
      redirect_to newreaction_path#user#to other things later
    end
  end
  def destroy
    sign_out
    redirect_to signin_path
  end
  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
