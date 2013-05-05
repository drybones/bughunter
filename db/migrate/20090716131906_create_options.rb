class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.string :name, :null => false
      t.text :value, :null => false

      t.timestamps
    end
    
    add_index :options, :name, :unique => true
  end

  def self.down
    drop_table :options
  end
end
