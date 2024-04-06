class AddFolloweesAndFollowersReferencesToFollow < ActiveRecord::Migration[7.1]
  def change
    add_reference :follows, :followers, foreign_key: {to_table: :users}
    add_reference :follows, :followees, foreign_key: {to_table: :users}
  end
end
