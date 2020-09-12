class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  default_scope -> { order(created_at: :desc) }

  validates :comment_content, presence: true, length: { maximum: 100 }
end
