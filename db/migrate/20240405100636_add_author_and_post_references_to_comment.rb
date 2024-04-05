class AddAuthorAndPostReferencesToComment < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :author, foreign_key: {to_table: :users}
    add_reference :comments, :post, foreign_key: "post_id"
  end
end
