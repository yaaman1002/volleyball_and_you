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
    @like = Like.find(params[:id])
    if @like.destroy
    end
  end

end
