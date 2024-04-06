class AddUniquenessIndexToFollowRequest < ActiveRecord::Migration[7.1]
  def change
    add_index :follow_requests, [:requester_id, :requestee_id]
  end
end
