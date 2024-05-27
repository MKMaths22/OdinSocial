class AddDefaultValuesToProfileFields < ActiveRecord::Migration[7.1]
  def change
    change_column :profiles, :field_name_one, :string, default: 'Favourite TV/Film'
    change_column :profiles, :field_name_two, :string, default: 'Favourite Book'
    change_column :profiles, :field_name_three, :string, default: 'Favourite Website'
  end
end
