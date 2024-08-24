class Public::UsersController < ApplicationController
  before_action :set_user, only: [:likes]

  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
    @relation_users = @user.followings & @user.followers
    @posts = @user.posts
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to users_path
      else
        render :edit
      end
  end

  def likes
    @user = User.find(params[:id])
    likes = Like.where(user_id: @user.id).pluck(:id)
    @like_posts = Post.find(likes)
  end

  def withdraw
    @user = User.find(params[:id])
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end

private

  def set_user
    @user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :last_name, :first_name, :kana_last, :kana_first)
  end

  def is_matching_login_user
    user=User.find(params[:id])
    unless user.id==current_user.id
      redirect_to users_path
    end
  end

end
