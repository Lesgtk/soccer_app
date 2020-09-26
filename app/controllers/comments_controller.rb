class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = 'コメントしました'
    else
      flash[:danger] = '投稿できませんでした'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = 'コメントが削除されました'
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
  end
end
