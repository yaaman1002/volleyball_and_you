class Public::CommentsController < ApplicationController
  def create
    @post=Post.find(params[:post_id])
    @comment=current_user.post_comment.new(comment_params)
    @comment.post_id=@post.id
    @comment.save
  end
  
  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    @post=Post.find(params[:id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

