class Public::RelationshipsController < ApplicationController
    before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
  end
  
  def following
    user = User.find(params[:relationship_id])
    @users = user.following
  end
  
  def followers
    user = User.find(params[:relationship_id])
    @users = user.folllowers
  end

end
