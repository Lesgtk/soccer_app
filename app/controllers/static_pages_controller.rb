class StaticPagesController < ApplicationController
  def home
    if logged_in?
       @post  = current_user.posts.build
       @feed_items = Post.all
     end
  end

  def about
  end

  def create
    @post  = current_user.posts.build
  end

end
