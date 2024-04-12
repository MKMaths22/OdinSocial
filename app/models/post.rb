class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :comments, dependent: :destroy
  has_many :likes, foreign_key: "liked_post_id", dependent: :destroy
  has_many :likers, through: :likes
end
