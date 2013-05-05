class AddHuntStartedAtToCandidate < ActiveRecord::Migration
  def self.up
    add_column :candidates, :hunt_started_at, :datetime
  end

  def self.down
    remove_column :candidates, :hunt_started_at
  end
end
