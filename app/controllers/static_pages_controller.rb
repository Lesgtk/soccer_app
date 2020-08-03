class StaticPagesController < ApplicationController
  def home
    if logged_in?
       @post  = current_user.posts.build
       @search_posts = Post.page(params[:page]).per(3)
       @feed_items = Post.page(params[:page]).per(3)
     end
  end

  def about
  end

  def create
    @post  = current_user.posts.build
  end

end
