class CreateWeapons < ActiveRecord::Migration
  def self.up
    create_table :weapons do |t|
      t.string :name
      t.integer :zombie_id

      t.timestamps
    end
  end

  def self.down
    drop_table :weapons
  end
end
