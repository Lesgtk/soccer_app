require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  before do
        @user = create(:user)
  end

  it 'ログインページの検証' do
    visit '/login'

    expect(page).to have_selector 'div',text: 'ログイン'
    expect(page).to have_field 'メールアドレス'
    expect(page).to have_field 'パスワード'
    expect(page).to have_unchecked_field('次回から自動的にログイン')
    expect(page).to have_button 'ログイン'
    expect(page).to have_no_button 'ゲストログイン(閲覧用)'
    expect(page).to have_link 'パスワードを忘れた方'
  end

  describe 'ログインページの登録検証' do
    it '登録が正しい場合、ログイン' do
      visit '/login'
      # email,password共に未入力
      click_button 'ログイン'
      expect(page).to have_content 'メールアドレスまたはパスワードが無効です'
      # 誤ったemail
      fill_in 'メールアドレス', with: 'invalidemail@sample.com'
      fill_in 'パスワード', with: @user.password
      click_button 'ログイン'
      expect(page).to have_content 'メールアドレスまたはパスワードが無効です'
      # 誤ったpassword
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: 'invalidpass'
      click_button 'ログイン'
      expect(page).to have_content 'メールアドレスまたはパスワードが無効です'
      # 有効なemail,password
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      click_button 'ログイン'
      expect(page).to have_content 'プロフィール'
    end

    it 'メール認証の完了していないユーザーのログインを許可しない' do
      unconfirmed_user = create(:user, :unconfirmed_user)
      visit '/login'
      fill_in 'メールアドレス',with: unconfirmed_user.email
      fill_in 'パスワード',with: unconfirmed_user.password
      click_button "ログイン"
      expect(page).to have_content 'ログイン'
    end
  end

  describe 'ログイン状態で変化するページ' do
    context '未ログイン状態では' do
      it '未ログインユーザー用のページが表示される' do
        visit root_path
        expect(page).to have_content 'ログイン'
      end
    end
  end
end
