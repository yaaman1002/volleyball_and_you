class Public::UsersController < ApplicationController
  before_action :set_user, only: [:likes]
  
  def index
    @users=User.all
    @user=User.find(current_user.id)
  end

  def show
    @user=User.find(params[:id])
    @posts=@user.posts
  end

  def edit
    @user=User.find(params[:id])
  end
  
  def update
    @user=User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path(@user.id)
      else
        render :edit
      end
  end
  
  def likes
    likes=Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts=Post.find(likes)
  end
  
private
  
  def set_user
    @user=User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def is_matching_login_user
    user=User.find(params[:id])
    unless user.id==current_user.id
      redirect_to users_path
    end
  end
  
end
