class UsersController < ApplicationController
  
  def index
    @title = "All users"
    # @users = User.all
    @users = User.paginate(:page => params[:page])
  end
   
  def new
    @title = "Create new user"
    @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      @title = "Create new user"
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
end
