class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:create]
  
  def new
    @page_id = "session_new"
    @user_session = UserSession.new
  end
 
  def create
    @page_id = "session_create"
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to :controller => 'maps', :action => 'index', :notice => 'Login Successful'
    else
      render :action => "new"
    end
  end
 
  def destroy
    @page_id = "session_destroy"
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to :action => "new" , :notice => 'Goodbye!'
  end
end
