class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc)} # 投稿の降順
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255}
end
