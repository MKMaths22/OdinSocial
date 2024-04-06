class FollowRequest < ApplicationRecord
  validates_uniqueness_of :requestee, :scope => :requester
  belongs_to :requestee, class_name: "User", foreign_key: "requestee_id"
  belongs_to :requester, class_name: "User", foreign_key: "requester_id"
end
