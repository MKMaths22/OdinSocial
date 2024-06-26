class Comment < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :post, foreign_key: "post_id"
end
