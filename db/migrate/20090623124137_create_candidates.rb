class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.string :name, :limit => 40, :null => false
      t.string :email, :limit => 100, :null => false
      t.string :token, :limit => 40, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end
