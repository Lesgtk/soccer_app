require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
     @user = users(:michael)
     # このコードは慣習的に正しくない
     @post = Post.new(content: "テスト", user_id: @user.id)
   end

   # ポストの確認
   test "should be valid" do
     assert @post.valid?
   end

   # user_idが存在するかどうか
   test "user id should be present" do
     @post.user_id = nil
     assert_not @post.valid?
   end
 end
