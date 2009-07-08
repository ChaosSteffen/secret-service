class Subject < ActiveRecord::Base
  belongs_to :level, :class_name => "Level", :foreign_key => "clearance"
  has_many :documents, :class_name => "Document"
end
