class AddOwnerIdToDelayedJobs < ActiveRecord::Migration
  def change
    add_column :delayed_jobs,:owner_id,:integer
  end
end
