class Post < ApplicationRecord
  # Add a SCOPE to automatically order by date
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :comments
  has_many :likes, foreign_key: "liked_post_id"
  has_many :likers, through: :likes
end
