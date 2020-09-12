require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  describe '存在性の検証' do
    it 'コンテントがない場合、無効であること' do
      post.content = ''
      expect(post.valid?).to eq(false)
    end
    it 'user_idがない場合、無効であること' do
      post.user_id = ''
      expect(post.valid?).to eq(false)
    end
    it 'タイトルがない場合、無効であること' do
      post.title = ''
      expect(post.valid?).to eq(false)
    end
    it 'カテゴリーがない場合、無効であること' do
      post.category = ''
      expect(post.valid?).to eq(false)
    end
    it '年齢別がない場合、無効であること' do
      post.age_type = ''
      expect(post.valid?).to eq(false)
    end
    it 'youtube_urlがある場合、有効であること' do
      post.youtube_url = ''
      expect(post.valid?).to eq(true)
    end
    it 'youtube_urlがない場合でも、有効であること' do
      post.youtube_url = ''
      expect(post.valid?).to eq(true)
    end
  end

  describe '文字数の検証' do
    it 'コンテントが255文字以内の場合、有効であること' do
      post.content = 'a' * 255
      expect(post).to be_valid
    end
  end
end
