class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    like = Like.new(user_id: current_user.id, post_id: @post.id)
    like.save
    @likes_count = Like.where(post_id: @post.id).count
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    like.destroy
    @likes_count = Like.where(post_id: @post.id).count
  end
end
