class Admin::UsersController < ApplicationController
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "ユーザーを削除しました。"
    redirect_to admin_dashboards_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "ユーザー情報を更新しました。"
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
