class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
    @comments = @post.comments
    @comment = Comment.new
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    url = params[:post][:youtube_url]
    url = url.last(11)
    @post.youtube_url = url
    if @post.save
      flash[:success] = '投稿しました'
      redirect_to root_url
    else
      render 'new'
      # flash[:danger] = '投稿できませんでした'
      # redirect_back(fallback_location: posts_path)
    end
  end

  def destroy
    @post.destroy
    flash.now[:danger] = '投稿を削除しました'
    redirect_to request.referrer || root_url # 削除する前のページに戻す
  end

  def likes
   @post = Post.find_by(id: params[:id])
   @likes = Like.where(post_id: @post.id)
  end

  private

  # .permitメソッドで許可していない項目は変更しない
  def post_params
    params.require(:post).permit(:title, :content, :age_type, :category, :youtube_url)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
