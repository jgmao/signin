class SessionsController < ApplicationController
  def new
    @title ="Sign in"
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
      redirect_to user#to other things later
    end
  end
  def destroy
    sign_out
    redirect_to signin_path
  end
end
