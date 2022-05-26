class CreateCommits < ActiveRecord::Migration[7.0]
  def change
    create_table :commits do |t|
      t.references :coder, null: false, foreign_key: true
      t.references :repository, null: false, foreign_key: true
      t.string :sha, null: false, unique: true
      t.integer :additions, null: false
      t.integer :deletions, null: false
      t.datetime :committed_at, null: false

      t.timestamps
    end
  end
end
