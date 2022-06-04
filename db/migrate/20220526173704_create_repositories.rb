class CreateRepositories < ActiveRecord::Migration[7.0]
  def change
    create_table :repositories do |t|
      t.string :name, null: false, unique: true
      t.string :path, null: false
      t.string :github_url, null: false
      t.string :clone_url, null: false

      t.timestamps
    end
  end
end
