require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }

  it '有効なファクトリを持つこと' do
    expect(comment).to be_valid
  end

  it 'コメント、ポスト、ユーザーがある場合、有効であること' do
    user = create(:user)
    post = create(:post)
    comment = Comment.new(
      comment_content: 'コメント',
      post: post,
      user: user
    )
    expect(comment).to be_valid
  end

  describe '存在性の確認' do
    it 'コメントがない場合、無効であること' do
      comment.comment_content = ' '
      comment.valid?
      expect(comment).to_not be_valid
    end

    it 'userがない場合、無効であること' do
      comment.user = nil
      comment.valid?
      expect(comment).to_not be_valid
    end
  end

  describe '文字数の検証' do
    it 'コメントが100文字以内の場合、有効であること' do
      comment.comment_content = 'a' * 100
      expect(comment).to be_valid
    end

    it 'コメントが101文字以内の場合、無効であること' do
      comment.comment_content = 'a' * 101
      expect(comment).to_not be_valid
    end
  end

  describe 'その他' do
    it 'コメントが降順になっていること' do
      post = create(:post)
      create(:comment, post: post, created_at: 5.days.ago)
      recent_comment = create(:comment, post: post, created_at: Time.zone.now)
      create(:comment, post: post, created_at: 10.minutes.ago)

      expect(recent_comment).to eq post.comments.first
    end
  end

end
