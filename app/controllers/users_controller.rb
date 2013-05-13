class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :index]

  def index
    @page_id = "user_index"
    @users = User.all
  end

  def show
    @page_id = "user_show"
    @user = User.find(params[:id])
  end

  def new
    @page_id = "user_new"
    @user = User.new
  end

  def edit
    @page_id = "user_edit"
    @user = User.find(params[:id])
  end

  def create
    @page_id = "user_create"
    @user = User.new(user_params)
    if @user.save
      redirect_to @users, notice: 'Registration successful.'
    else
      render action: "new" 
    end
  end
  def update
    @page_id = "user_update"
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit" 
    end
  end
  def destroy
    @page_id = "user_destroy"
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private
  def user_params
    params.require(:user).permit(:crypted_password, :email, :password_salt, :persistence_token, :username, :password, :password_confirmation)
  end     
end
