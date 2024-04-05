class AddUserReferenceToProfile < ActiveRecord::Migration[7.1]
  def change
    add_reference :profiles, :user, foreign_key: true
  end
end
