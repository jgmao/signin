class UsersController < ApplicationController
  #before_filter :authenticate, :only => [:edit , :update] #only allow authenticated user to edit and update 
  #before_filter :correct_user, :only => [:edit , :update] #only correct user can edit and update
  before_filter :admin_user, :only => [:create,:new, :destroy, :index]
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
    if current_user.admin
      User.find(params[:id]).destroy
      flash[:success] = "User destroyed."
      redirect_to users_path
    else
      flash[:error] = "Cannot delete user since you are not administrator."
    end
  end
  
  private
  def authenticate
    deny_access unless signed_in?
  end
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin
  end
end
