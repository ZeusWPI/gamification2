class AddOrganisationToRepo < ActiveRecord::Migration[7.0]
  def change
    change_table :repositories do |t|
      t.string :organisation
      Repository.all.update_all(organisation: 'ZeusWPI')
      t.change_null :organisation, false
    end
  end
end
