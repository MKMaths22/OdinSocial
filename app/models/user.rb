class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :rememberable, :validatable
  # has_one :profile
  has_many :authored_posts, class_name: "Post", foreign_key: "author_id" 
end
