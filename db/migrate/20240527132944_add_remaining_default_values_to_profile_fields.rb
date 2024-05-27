class AddRemainingDefaultValuesToProfileFields < ActiveRecord::Migration[7.1]
  def change
      change_column :profiles, :field_content_one, :string, default: ''
      change_column :profiles, :field_content_two, :string, default: ''
      change_column :profiles, :field_content_three, :string, default: ''
      change_column :profiles, :body, :text, default: ''
  end
end
