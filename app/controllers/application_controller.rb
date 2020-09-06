class ApplicationController < ActionController::Base
  before_action :set_search
  protect_from_forgery with: :exception
  include SessionsHelper

  # 検索機能
  def set_search
    @search = Post.ransack(params[:q])
    @search_posts = @search.result
  end

  private

  # ユーザーのログインを確認する
  def logged_in_user
    return if logged_in?

    store_location
    flash[:denger] = 'ログインしてください'
    redirect_to login_url
  end
end
