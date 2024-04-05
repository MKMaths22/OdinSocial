class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.text :body
      t.string :photo

      t.timestamps
    end
  end
end
