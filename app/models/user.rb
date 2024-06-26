class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :rememberable, :validatable
  validates :name, presence: true
  has_one :profile, dependent: :destroy
  has_many :authored_posts, class_name: "Post", foreign_key: "author_id", dependent: :destroy
  has_many :authored_comments, class_name: "Comment", foreign_key: "author_id", dependent: :destroy
  has_many :likes, class_name: "Like", foreign_key: "liker_id", dependent: :destroy
  # the likes one user has many of are the likes they have given to posts
  has_many :liked_posts, through: :likes
  # the posts the user has liked
  has_many :outgoing_follow_requests, class_name: "FollowRequest", foreign_key: "requester_id", dependent: :destroy
  has_many :incoming_follow_requests, class_name: "FollowRequest", foreign_key: "requestee_id", dependent: :destroy
  has_many :requestees, through: :outgoing_follow_requests
  has_many :requesters, through: :incoming_follow_requests
  has_many :outgoing_follows, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :incoming_follows, class_name: "Follow", foreign_key: "followee_id", dependent: :destroy
  has_many :followees, through: :outgoing_follows
  has_many :followers, through: :incoming_follows
  
  def self.users_to_request(user = current_user)
    # It would be nice if something like this worked:
    # User.where.not(user.requestees).where.not(user.followees).where.not(user)
    output_array = []
    User.all.each do |person|
      output_array.push(person) unless ((person == user) | (user.requestees.include?(person)) | (user.followees.include?(person)))
    end
    output_array
  end
end
