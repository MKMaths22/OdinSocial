class AddRequesteeAndRequesterReferencesToFollowRequest < ActiveRecord::Migration[7.1]
  def change
    add_reference :follow_requests, :requestee, foreign_key: {to_table: :users}
    add_reference :follow_requests, :requester, foreign_key: {to_table: :users}
  end
end
