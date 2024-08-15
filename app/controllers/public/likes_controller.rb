class Public::LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.new
    @like.post_id = @post.id
    if @like.save
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find_by(post_id: @post.id, user_id: current_user.id)
    if @like.destroy
    end
  end

end
