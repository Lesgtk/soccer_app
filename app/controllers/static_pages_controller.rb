class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post  = current_user.posts.build
      @feed_items = Post.page(params[:page]).per(3)
      @q = Post.ransack(params[:search])
      @search_posts = @q.result.page(params[:page]).per(3)
    end
  end

  def about
  end

  def create
    @post  = current_user.posts.build
  end

  def likes
    if logged_in?
      @post  = current_user.posts.build
      @search_posts = Post.page(params[:page]).per(3)
      @feed_items = Post.page(params[:page]).per(3)
      @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
    end
  end

  def search
    @q = Post.ransack(search_params)
    @feed_items = @q.result.page(params[:page]).per(3)
  end

  private

  def search_params
    params.require(:q).permit!
  end

end
