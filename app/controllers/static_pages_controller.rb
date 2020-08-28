class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post  = current_user.posts.build
      @feed_items = Post.page(params[:page]).per(10)
      @q = Post.ransack(params[:q])
      @search_posts = @q.result.page(params[:page]).per(10)
    end
  end

  def about
  end

  def create
    @post  = current_user.posts.build
    @q = Post.ransack(params[:q])
  end

  def likes
    if logged_in?
      @post  = current_user.posts.build
      # @feed_items = Post.page(params[:page]).per(10)
      @q = Post.ransack(params[:q])
      @search_posts = @q.result.page(params[:page]).per(10)
      @feed_items = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    end
  end

  def search
    @q = Post.ransack(params[:search])
    @feed_items = @q.result.page(params[:page]).per(10)
  end

  private

  def search_params
    params.require(:q).permit!
  end

end
