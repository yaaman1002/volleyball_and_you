class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to admin_dashboards_path
       else
         render :edit
       end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end