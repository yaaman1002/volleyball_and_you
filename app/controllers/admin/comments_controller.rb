class Admin::CommentsController < ApplicationController
  
  def index
    @comments = Comment.page(params[:page])
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントを削除しました。" 
    redirect_to admin_comments_path
  end
end
