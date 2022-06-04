class CreateGitIdentities < ActiveRecord::Migration[7.0]
  def change
    create_table :git_identities do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.references :coder, null: false, foreign_key: true

      t.timestamps

      t.index [:name, :email], unique: true
    end
  end
end
