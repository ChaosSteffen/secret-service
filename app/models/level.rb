class Level < ActiveRecord::Base
  has_many :subjects, :class_name => "Subject", :foreign_key => "clearance"
  has_many :documents, :class_name => "Document", :foreign_key => "classification"
end
