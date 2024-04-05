class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :rememberable, :validatable
  validates :name, presence: true
  has_one :profile
  has_many :authored_posts, class_name: "Post", foreign_key: "author_id"
  has_many :authored_comments, class_name: "Comment", foreign_key: "author_id"
  has_many :likes, class_name: "Like", foreign_key: "liker_id"
  # the likes one user has many of are the likes they have given to posts
  has_many :liked_posts, through: :likes
  # the posts the user has liked
end
