class Public::CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
   if @comment.save
     flash.now[:notice] = "コメントの投稿に成功しました"
   else 
    flash.now[:alert] = "コメントの投稿に失敗しました"
   end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
   if @comment.destroy
    flash.now[:notice] = "コメント削除に成功しました"
   end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

