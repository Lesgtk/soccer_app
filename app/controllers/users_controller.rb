class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ようこそ SOOCER APPへ!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(params[:id])
  end

private

  # 下記以外を許可しない
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
