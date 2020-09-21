require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = build(:user)
  end

  it '有効なファクトリを持つこと' do
    expect(build(:user)).to be_valid
  end

  describe 'バリデーション' do
    it 'nameとemailどちらも値が設定されていれば、OK' do
      expect(@user.valid?).to eq(true)
    end

    it 'nameが空だとNG' do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空だとNG' do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it 'パスワードがない場合、無効であること' do
      @user.password = @user.password_confirmation = ' ' * 6
      @user.valid?
      expect(@user).to_not be_valid
    end
  end

  describe '文字数の検証' do
    it '名前が20文字以内の場合、有効であること' do
      @user.name = 'a' * 20
      expect(@user).to be_valid
    end

    it '名前が11文字以上の場合、無効であること' do
      @user.name = 'a' * 21
      expect(@user).to_not be_valid
    end

    it 'メールアドレスが255文字以内の場合、有効であること' do
      @user.email = 'a' * 243 + '@example.com'
      expect(@user).to be_valid
    end

    it 'メールアドレスが255文字を越える場合、無効であること' do
      @user.email = 'a' * 244 + '@example.com'
      @user.valid?
      expect(@user.errors).to be_added(:email, :too_long, count: 255)
    end

    it 'パスワードが6文字以上の場合、有効であること' do
      @user.password = @user.password_confirmation = 'a' * 6
      expect(@user).to be_valid
    end

    it 'パスワードが6文字未満の場合、無効であること' do
      @user.password = 'a' * 5
      @user.valid?
      expect(@user.errors).to be_added(:password, :too_short, count: 6)
    end
  end

  describe 'メールアドレス' do
    it '重複したメールアドレスの場合、無効であること' do
      user1 = create(:user, name: 'kame1', email: 'kame@example.com')
      user2 = build(:user, name: 'kame2', email: user1.email)
      expect(user2).to_not be_valid
    end

    it '重複でないメールアドレスの場合、有効であること' do
      user2 = build(:user, name: 'kame2', email: 'kame2@example.com')
      expect(user2).to be_valid
    end

    it '無効なメールアドレスかどうか' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe 'パスワードの検証' do
    it 'パスワードが暗号化されていること' do
      @user = create(:user)
      expect(@user.password_digest).to_not eq 'password'
    end
  end

  describe 'パスワード' do
    it 'メールアドレスがすべて小文字で保存されること' do
      @user.email = 'TeSt@ExaMPle.CoM'
      @user.save!
      expect(@user.reload.email).to eq 'test@example.com'
    end
  end
end
