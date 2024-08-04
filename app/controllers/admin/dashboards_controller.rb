class Admin::DashboardsController < ApplicationController
  layout 'admin'
  
  def index
    @users = User.all
  end
  
  def edit 
    @user = User.find(params[:id])
  end
end
