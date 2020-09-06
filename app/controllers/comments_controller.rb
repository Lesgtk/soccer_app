class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    flash[:success] = if @comment.save
                        'コメントしました'
                      else
                        'コメントできませんでした'
                      end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :post_id)
  end
end
