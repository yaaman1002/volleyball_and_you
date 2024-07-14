class Public::LikedPostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :post_params, only: [:create, :destroy]

  def create
    Liked_post.create(user_id: current_user.id, post_id: @post.id)
  end
  
  def destroy
    liked_post = Liked_post.find_by(user_id: current_user.id, post_id: @post.id)
    liked_post.destroy
  end
  
  private
  def post_params
    @post=Post.find(params[:post_id])
  end
end
