class Admin::PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿情報を更新しました。"
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
