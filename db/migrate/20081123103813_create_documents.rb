class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :name
      t.text :content
      t.integer :classification
      t.integer :subject_id

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
