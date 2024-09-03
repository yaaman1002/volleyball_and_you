class Admin::CommentsController < ApplicationController
  
  def index
    @comments = Comment.all
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました。" 
    redirect_to admin_comments_path
  end
end
