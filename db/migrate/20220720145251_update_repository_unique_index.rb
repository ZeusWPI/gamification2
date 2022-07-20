class UpdateRepositoryUniqueIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :repositories, %i[organisation name], unique: true
    add_index :coders, :github_name, unique: true
  end
end
