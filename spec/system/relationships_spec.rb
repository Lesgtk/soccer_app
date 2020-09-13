require 'rails_helper'

RSpec.describe 'Relationships', type: :system do
  let!(:alice) do
    create(:user,
           name: 'Alice',
           email: 'alice@example.com',
           password: 'password_alice',
           password_confirmation: 'password_alice')
  end
  let!(:bob) do
    create(:user,
           name: 'Bob',
           email: 'bob@example.com',
           password: 'password_bob',
           password_confirmation: 'password_bob')
  end
  let!(:bob_post) do
    create(:post, user: bob)
  end

  it 'ユーザーをフォロー/フォロー解除する', js: true do
    visit '/login'

    # Aliceがログインする
    click_link 'ログイン'
    expect(page).to have_content '次回から自動的にログイン'

    fill_in 'メールアドレス', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password_alice'
    click_button 'ログイン'
    expect(page).to have_content 'プロフィール'

    # Bobのページへ移動する
    click_link 'ユーザー一覧'
    click_link 'Bob'
    expect(current_path).to eq "/users/#{bob.id}"
  end
end
