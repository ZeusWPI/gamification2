class CreateOrganisationMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :organisation_members do |t|
      t.string :organisation, null: false
      t.string :github_name, null: false
    end
    add_index :organisation_members, %i[organisation github_name], unique: true
  end
end
