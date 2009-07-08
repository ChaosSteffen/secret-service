class AddPriority < ActiveRecord::Migration
  def self.up
    add_column :levels, :priority, :integer
  end

  def self.down
    remove_column :levels, :priority
  end
end
