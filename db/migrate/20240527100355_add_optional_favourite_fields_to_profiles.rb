class AddOptionalFavouriteFieldsToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :field_name_one, :string
    add_column :profiles, :field_content_one, :string
    add_column :profiles, :field_name_two, :string
    add_column :profiles, :field_content_two, :string
    add_column :profiles, :field_name_three, :string
    add_column :profiles, :field_content_three, :string
  end
end
