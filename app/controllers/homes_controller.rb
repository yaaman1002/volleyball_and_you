class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  
  def top
    @new_posts=Post.order(created_at: :desc).limit(1)
  end
  
  def about
  end
  
  private
  
  def homes_params
    params.require(:home).permit(:name, :profile_image, :introduction)
  end
end
