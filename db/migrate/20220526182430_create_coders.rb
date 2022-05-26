class CreateCoders < ActiveRecord::Migration[7.0]
  def change
    create_table :coders do |t|
      t.string :full_name, null: false
      t.string :github_name, null: false, unique: true
      t.string :avatar_url, null: false
      t.string :github_url, null: false

      t.timestamps
    end
  end
end
