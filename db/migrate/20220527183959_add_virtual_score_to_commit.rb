class AddVirtualScoreToCommit < ActiveRecord::Migration[7.0]
  def change
    change_table :commits do |t|
      t.virtual :score, type: :integer, as: 'ROUND(LN(additions + 1) * 10)', stored: true
    end
  end
end
