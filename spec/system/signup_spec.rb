require 'rails_helper'

RSpec.describe 'Signup', type: :system do
  it '新規登録ページの検証' do
    visit '/signup'

    expect(page).to have_selector 'div', text: '新規ユーザー登録'
    expect(page).to have_field 'ユーザー名'
    expect(page).to have_field 'メールアドレス'
    expect(page).to have_field 'パスワード(6文字以上)'
    expect(page).to have_field 'パスワード(確認用)'
    expect(page).to have_button '登録する'
  end

  describe '新規登録ページの登録検証' do
    it 'ユーザーを新規登録可能' do
      visit 'signup'

      fill_in 'ユーザー名', with: 'testuser'
      fill_in 'メールアドレス', with: 'test@example.com'
      fill_in 'パスワード(6文字以上)', with: '123456'
      fill_in 'パスワード(確認用)', with: '123456'
      click_button '登録する'

      # ログイン画面にリダイレクト
      expect(current_path).to eq '/'
      expect(page).to have_content 'メールを確認して、アカウントを有効にしてください'
    end

    it '不適切な入力は新規登録を許可しない' do
      visit 'signup'

      fill_in 'ユーザー名', with: ''
      fill_in 'メールアドレス', with: 'test@test'
      fill_in 'パスワード(6文字以上)', with: '12345'
      fill_in 'パスワード(確認用)', with: '12354'
      click_button '登録する'
      expect(page).to have_content '名前を入力してください'
      expect(page).to have_content 'メールアドレスは不正な値です'
      expect(page).to have_content 'パスワードは6文字以上で入力してください'
      expect(page).to have_content 'パスワード（確認用）とパスワードの入力が一致しません'
    end
  end
end
