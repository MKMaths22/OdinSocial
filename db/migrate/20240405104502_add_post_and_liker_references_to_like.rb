class AddPostAndLikerReferencesToLike < ActiveRecord::Migration[7.1]
  def change
    add_reference :likes, :liker, foreign_key: {to_table: :users}
    add_reference :likes, :post, foreign_key: "post_id"
  end
end
