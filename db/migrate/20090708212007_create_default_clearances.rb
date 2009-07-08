class CreateDefaultClearances < ActiveRecord::Migration
  def self.up
    Level.new(:name => "unconfidential", :priority => 0).save
    Level.new(:name => "confidential", :priority => 1).save
    Level.new(:name => "secret", :priority => 2).save
    Level.new(:name => "top-secret", :priority => 3).save
  end

  def self.down
  end
end
