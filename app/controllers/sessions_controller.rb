class SessionsController < ApplicationController
  def new; end

  def new_guest
    user = User.find(1)
    log_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました'
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = 'アカウントは有効化されていません'
        message += 'メールのリンクをチェックしてください'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが無効です'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
