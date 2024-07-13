class Public::UsersController < ApplicationController
  
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
        redirect_to users_path
      else
        render :edit
      end
  end
  
  private
  
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
