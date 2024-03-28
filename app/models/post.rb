class Post < ApplicationRecord
  # Add a SCOPE to automatically order by date
  belongs_to :author, class_name: "User", foreign_key: "author_id"
end
