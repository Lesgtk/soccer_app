class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)} # 投稿の降順
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255}

  enum age_type: { 小学生以下: 1, 中学生: 2, 高校生: 3, 社会人: 4, 全対象: 5}
  enum category: {技術: 1, 戦術: 2, 知識: 3, メンタル: 4, 練習メニュー: 5}
end
