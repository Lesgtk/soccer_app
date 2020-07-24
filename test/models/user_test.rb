require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  # userが存在するかどうか
  test "should be valid" do
    assert @user.valid?
  end

  # nameが空文字かどうか
  test "name should be present" do
    @user.name = " "
    assert_not @user.valid?
  end

  # emailが空文字かどうか
  test "email should be present" do
    @user.email = " "
    assert_not @user.valid?
  end

  # nameが50文字以内か
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  # emailが255文字以内か
  test "email should not be too long" do
    @user.name = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  # 無効なemailアドレスか判断
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  # 重複したemailがどうか
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  # emailを小文字かどうか
  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExaMPlE.coM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

end
