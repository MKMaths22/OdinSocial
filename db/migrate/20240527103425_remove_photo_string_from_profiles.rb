class RemovePhotoStringFromProfiles < ActiveRecord::Migration[7.1]
  def change
    remove_column :profiles, :photo
  end
end
