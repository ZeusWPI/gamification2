class RemoveDelayedJob < ActiveRecord::Migration[7.2]
  def change
    drop_table :delayed_jobs
  end
end