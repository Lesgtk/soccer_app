require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @post = @user.posts.build(content: 'テスト')
  end

  # ポストの確認
  test 'should be valid' do
    assert @post.valid?
  end

  # user_idが存在するかどうか
  test 'user id should be present' do
    @post.user_id = nil
    assert_not @post.valid?
  end

  # contentが存在するかどうか
  test 'content should be present' do
    @post.content = nil
    assert_not @post.valid?
  end

  # contentの長さのテスト
  test 'content should be at most 255 characters' do
    @post.content = 'a' * 256
    assert_not @post.valid?
  end

  # ポストの順序付けをテスト
  test 'order should be most recent first' do
    assert_equal posts(:most_recent), Post.first
  end
end
