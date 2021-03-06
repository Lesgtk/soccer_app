class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy
                                          following followers]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: :destroy
  before_action :check_guest, only: :update

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    # ログインしていなかった場合は401ページを表示して終了（※ 401用のテンプレートファイルを作っていないと動きません）
    render(template: 'errors/401', status: 401) and return if current_user.blank?

    @user = User.find_by(id: params[:id])
    @posts = @user.posts
    @likes = Like.where(user_id: @user.id).count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'メールを確認して、アカウントを有効にしてください'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'マイページを更新しました'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'ユーザーを削除しました'
    redirect_to users_url
  end

  def following
    @title = 'Following'
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(10)
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    render 'show_follow'
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  private

  # 下記以外を許可しない
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

  # beforeアクション

  # ゲストログインの制限
  def check_guest
    return unless current_user.email == 'test@example.com'

    flash[:danger] = 'テストユーザーのため編集できません'
    redirect_to user_path(current_user)
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # 管理者かどうか確認
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
